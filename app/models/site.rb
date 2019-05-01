class Site < ApplicationRecord
  has_many :hotel_sites
  validates :name, uniqueness: true

end
