class ApplicationRecord < ActiveRecord::Base
  include ApplicationHelper
  self.abstract_class = true
  require "open-uri"

  def main_site
    doc = Nokogiri::HTML(open("https://www.trauminselreisen.de/reiseauswahl/", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  end

  def ewtc_site
    doc = Nokogiri::HTML(open("https://www.ewtc.de/Dubai/Dubai-Strand/Hotel-Preise-Sommer/Burj-Al-Arab-Jumeirah.html#hotelpreise", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    table = doc.css("#preiseuebersicht")
    count = table.css("tr").count
    mont = ""
    table.css("tr")[1..count].each do |tr|
      if months_compact.any? { |m| tr.text.include? m }
      end
    end
  end

  def soneva_tui
    sort_link = "https://www.tui.com/pauschalreisen/suchen/angebote/Soneva-Fushi/21922"
    hot = "Soneva Fushi"
    tui_site(sort_link, hot)
  end

  def ozen_tui
    sort_link = "https://www.tui.com/pauschalreisen/suchen/angebote/OZEN-by-Atmosphere/499454"
    hot = "OZEN by Atmosphere"
    tui_site(sort_link, hot)
  end

  def vakkaru_tui
    sort_link = "https://www.tui.com/pauschalreisen/suchen/angebote/Vakkaru-Maldives/653304"
    hot = "Vakkaru"
    tui_site(sort_link, hot)
  end

  def tui
    s = Site.find_by_name("TUI")
    sort_link = "https://www.tui.com/pauschalreisen/suchen/angebote/Vakkaru-Maldives/653304"
    hot = "Vakkaru"
    h = Hotel.find_by_name(hot)
    hs = h.hotel_sites.find_by(site_id: s.id)
    hs.update(link: sort_link)
  end

  def tui_site(sort_link, hot)
    browser = Watir::Browser.new
    for i in Date.current.month..12
      i = i.to_s.length == 1 ? "0" + i.to_s : i.to_s
      link = sort_link + "?departureAirports=FRA&showTotalPrice=true&startDate=#{Date.current.year.to_s}-#{i}-01&endDate=#{Date.current.year.to_s}-#{i}-08&duration=7&abtestSuperLastMinute=true&boardTypes=HB&links=1"
      browser.goto link
      sleep 30
      doc = Nokogiri::HTML.parse(browser.html)
      doc.css("article.pt__box").each do |box|
        title = box.css("span.u-l-vi").text
        price = box.css("p.pt__cta-price span.amount").text
        h = Hotel.find_by_name(hot)
        s = Site.find_by_name("TUI")
        hs = h.hotel_sites.where(site_id: s.id).take
        ht = HotelType.find_by(name: title, hotel_site_id: hs.id, year: Date.current.year)
        ht = if ht.present?
               ht
             else
               HotelType.create(name: title, year: Date.current.year, link: link, hotel_site_id: hs.id)
             end

        mp = MonthPrice.find_by(hotel_type_id: ht.id, month: months_compact[i.to_i - 1])
        if mp.present?
          unless (price == mp.price_concurrent) && price != 0
            mp.update(price_concurrent: price)
          end
        else
          mp = MonthPrice.create(hotel_type_id: ht.id, link: sort_link, price_concurrent: price, month: months_compact[i.to_i - 1])
        end
      end
    end
    browser.close
  end
end
