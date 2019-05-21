class MonthPrice < ApplicationRecord
  belongs_to :hotel_type, optional: true
  belongs_to :origin, optional: true
end
