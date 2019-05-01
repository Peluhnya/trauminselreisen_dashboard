class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'open-uri'
  require 'openssl'

  def main_site
    doc = Nokogiri::HTML(open('https://www.trauminselreisen.de/reiseauswahl/', ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  end

  def ewtc_site
    doc = Nokogiri::HTML(open('https://www.ewtc.de/Dubai/Dubai-Strand/Hotel-Preise-Sommer/Burj-Al-Arab-Jumeirah.html#hotelpreise', ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))

  end
end
