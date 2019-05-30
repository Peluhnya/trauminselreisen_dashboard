class FixNotNullMonthPrices < ActiveRecord::Migration[6.0]
  def change
    remove_column :month_prices, :hotel_type_id
    add_reference :month_prices, :hotel_type, foreign_key: true

  end
end
