class Site < ApplicationRecord
  has_many :hotel_sites
  has_many :hotel_types, through: :hotel_sites
  has_many :month_prices, through: :hotel_sites
  validates :name, uniqueness: true
  has_one_attached :logo

end
