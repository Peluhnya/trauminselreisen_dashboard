# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include ApplicationHelper
  self.abstract_class = true
  require 'open-uri'
  require 'headless'

  def main_site
    Hotel.where(active:true).where.not(origin_url: [nil, '']).each do |hot|
      doc = Nokogiri::HTML(open(hot.origin_url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
      table = doc.css(".simpletoggle.price-period.room-price-period")
      table.each do |item|
        header = item.css('.simpletoggle-header.price-period-header').text
        months = header.split('bis')
        onemonth = nil
        twomonth = nil
        I18n.t("date.month_names").compact.each do |m|
          onemonth = m if (months.first.include? m)
          twomonth = m if (months.last.include? m)
        end
        ms = I18n.t("date.month_names").compact
        ms.each do |m|
          if m == onemonth
            break
          else
            ms.shift
          end
        end
        ms.reverse.each do |m|
          if m == twomonth
            break
          else
            ms.pop
          end
        end
        hotels = item.css('.room-toggle')
        hotels.each do |hotel|
        name = hotel.css(".room-name").text.split(' (').first
        origin = Origin.find_by_name(name)
        unless origin.present?
          origin = Origin.create(name: name, hotel_id: hot.id)
        end
        price_line = hotel.css(".price-row").first
        price = price_line.css(".price").text.gsub(" €",'').gsub(".", "").strip
          ms.each do |month|
            mp = MonthPrice.find_by(origin_id: origin.id, month: month, year: 2019)
            if mp.present?
              unless (price == mp.price) && price != 0
                mp.update(price: price)
              end
            else
              mp = MonthPrice.create(origin_id: origin.id, price: price.to_i, month: month, year: 2019)
            
              puts origin.id
              puts mp.id
              puts price
            end
          end
        end
      end
    end
  end

  def ewtc_site
    doc = Nokogiri::HTML(open('https://www.ewtc.de/Dubai/Dubai-Strand/Hotel-Preise-Sommer/Burj-Al-Arab-Jumeirah.html#hotelpreise', ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    table = doc.css('#preiseuebersicht')
    count = table.css('tr').count
    mont = ''
    table.css('tr')[1..count].each do |tr|
      if months_compact.any? { |m| tr.text.include? m }
      end
    end
  end

  def airtour
    hss = HotelSite.where(site_id: 3).where.not(link: [nil, ''])
    hss.each do |hs|
      sort_link = hs.link
      hot = hs.hotel.name
      airtour_site(sort_link, hot)
    end
  end

  def dertour
    hss = HotelSite.where(site_id: 6).where.not(link: [nil, ''])
    hss.each do |hs|
      sort_link = hs.link
      hot = hs.hotel.name
      dertour_site(sort_link, hot)
    end
  end

  def fti
    hss = HotelSite.where(site_id: 4).where.not(link: [nil, ''])
    hss.each do |hs|
      sort_link = hs.link
      hot = hs.hotel.name
      fti_site(sort_link, hot)
    end
  end


  def fti_site(sort_link, hot)
    browser =  Watir::Browser.new :chrome, proxy: proxy

        (Date.current.month..12).each do |i|
          i = i.to_s.length == 1 ? '0' + i.to_s : i.to_s
          link = "https://booking.fti.de/offer?ibe=package&bSearchformSent=1&depap=FRA&ddate=#{Date.current.year}-#{i}-01&rdate=#{Date.current.year}-#{i}-08&adult=2&#{sort_link}&brand=FTI,XFTI"
          browser.goto link
          sleep 30
          doc = Nokogiri::HTML.parse(browser.html)
          doc.css('.list-offer-items').each do |box|
            title = box.css('.items-rooms span')[1].text.strip
            price = box.css('.price-amount').text.gsub('.','').strip
            h = Hotel.find_by_name(hot)
            s = Site.find(4)
            new_price(sort_link, hot, title, price, h, s, box, link, i)
          end
        end
        browser.quit
  end

  def dertour_site(sort_link, hot)
    browser =  Watir::Browser.new :chrome, proxy: proxy, headless: true
    (Date.current.month..12).each do |i|
      i = i.to_s.length == 1 ? '0' + i.to_s : i.to_s
      link = sort_link + "?earliestStart=01.#{i}.#{Date.current.year}&latestEnd=08.#{i}.#{Date.current.year}&locationCode=CIT_120491&locationName=Soneva+Fushi%2C+Süd-Maalhosmadulu-Atoll%2C+Nördliche+Atolle%2C+Malediven&numberOfAdults=2&numberOfUnits=1&productType=HOTEL&sorting=price_asc&tab=angebote"
      browser.goto link
      sleep 30
      doc = Nokogiri::HTML.parse(browser.html)
      doc.css('.ProductOffer.column.small-12').each do |box|
        title = box.css('.ProductOffer__categoryName.text-copy-small').text.gsub('1x','').strip
        price = box.css('.Price__value.regtest-currency-value').text.gsub('.','').gsub(",-",'')
        h = Hotel.find_by_name(hot)
        s = Site.find(6)
        new_price(sort_link, hot, title, price, h, s, box, link, i)
      end
    end
    browser.quit

  end

  def airtour_site(sort_link, hot)
    browser =  Watir::Browser.new :chrome, proxy: proxy, headless: true
    (Date.current.month..12).each do |i|
      i = i.to_s.length == 1 ? '0' + i.to_s : i.to_s
      link = sort_link + "?searchScope=HOTEL&showTotalPrice=true&startDate=#{Date.current.year}-#{i}-01&endDate=#{Date.current.year}-#{i}-08&duration=7&sortOffersField=roomType&sortOffersAsc=false&boardTypes=HB&links=1"
      browser.goto link 
      sleep 30
      doc = Nokogiri::HTML.parse(browser.html)
      doc.css('.resultListItems article').each do |box|
        title = box.css('.productInformationLink.ng-binding').text.strip
        price = box.css('span.price.ng-binding').text
        h = Hotel.find_by_name(hot)
        s = Site.find(3)
        new_price(sort_link, hot, title, price, h, s, box, link, i)
      end
    end
    browser.close
  end

  def tui
    hss = HotelSite.where(site_id: 2).where.not(link: [nil, ''])
    hss.each do |hs|
      sort_link = hs.link
      hot = hs.hotel.name
      tui_site(sort_link, hot)
    end
  end

  def tui_site(sort_link, hot)
    browser =  Watir::Browser.new :chrome, proxy: proxy, headless: true
    (Date.current.month..12).each do |i|
      i = i.to_s.length == 1 ? '0' + i.to_s : i.to_s
      link = sort_link + "?departureAirports=FRA&showTotalPrice=true&startDate=#{Date.current.year}-#{i}-01&endDate=#{Date.current.year}-#{i}-08&duration=7&abtestSuperLastMinute=true&boardTypes=HB&links=1"
      browser.goto link 
      sleep 30
      doc = Nokogiri::HTML.parse(browser.html)
      doc.css('article.pt__box').each do |box|
        title = box.css('span.u-l-vi').text.split(' (').first
        price = box.css('p.pt__cta-price span.amount').text.gsub('.','')
        h = Hotel.find_by_name(hot)
        s = Site.find_by_name('TUI')
        new_price(sort_link, hot, title, price, h, s, box, link, i)
      end
    end
    browser.close
  end

  def proxy
    proxy = {
      http: '35.158.114.186:3128',
      ssl:  '35.158.114.186:3128'
    }
  end

  def new_price(sort_link, hot, title, price, h, s, box, link, i)
    hs = h.hotel_sites.where(site_id: s.id).take
    origin = h.origins.where(name: title).take
    if origin.nil?
      origin = Origin.create(name: title, hotel_id: h.id)
    end
    ht = HotelType.find_by(origin_id: origin.id, hotel_site_id: hs.id)
    ht = if ht.present?
           ht
         else
           HotelType.create(origin_id: origin.id, link: link, hotel_site_id: hs.id)
         end
    
    omp = origin.month_prices.where(month: months_compact[i.to_i - 1], year: Date.current.year).take
    mp = MonthPrice.find_by(hotel_type_id: ht.id, month: months_compact[i.to_i - 1], year: Date.current.year)
    if omp.nil? 
      @option = 'unchanged'
    else
      or_price = omp.price * 2 * 7
      if or_price > price.to_i
        @option = 'up'
      elsif or_price < price.to_i
        @option = 'down'
      else
        @option = 'unchanged'
      end
    end
    if mp.present?
      unless (price == mp.price) && price != 0
        mp.update(price: price, price_option: @option)
      end
    else
      mp = MonthPrice.create(hotel_type_id: ht.id, link: sort_link, price: price, month: months_compact[i.to_i - 1], year: Date.current.year, price_option: @option)
    
    end
  end

end
