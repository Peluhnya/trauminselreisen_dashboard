class Site < ApplicationRecord
  has_many :hotel_sites
  validates :name, uniqueness: true
  has_one_attached :logo

end
