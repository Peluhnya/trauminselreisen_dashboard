class Hotel < ApplicationRecord
  has_many :hotel_sites
  has_many :hotel_types, through: :hotel_sites
  has_many :sites, through: :hotel_sites
  has_many :origins
  validates :name, uniqueness: true
end
