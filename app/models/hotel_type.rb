class HotelType < ApplicationRecord
  belongs_to :hotel_site
  has_many :month_prices
end
