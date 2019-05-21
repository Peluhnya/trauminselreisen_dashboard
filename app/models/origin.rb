class Origin < ApplicationRecord
  belongs_to :hotel
  has_many :month_prices
  has_many :hotel_types
end







