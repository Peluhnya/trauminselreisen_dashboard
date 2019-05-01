class Hotel < ApplicationRecord
  has_many :hotel_sites
  has_many :hotel_types, through: :hotel_sites
  has_many :sites
  validates :name, uniqueness: true
end
