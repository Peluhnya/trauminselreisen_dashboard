class HotelSite < ApplicationRecord
  belongs_to :hotel
  belongs_to :site
  has_many :hotel_types
  has_many :month_prices, through: :hotel_types
end
