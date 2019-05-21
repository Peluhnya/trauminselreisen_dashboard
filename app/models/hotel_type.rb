class HotelType < ApplicationRecord
  belongs_to :hotel_site
  has_many :month_prices
  belongs_to :origin
end
