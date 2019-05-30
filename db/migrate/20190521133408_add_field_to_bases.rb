class AddFieldToBases < ActiveRecord::Migration[6.0]
  def change
    remove_column :hotel_types, :name
    remove_column :hotel_types, :year
    add_column :hotels, :origin_url, :string
    remove_column :month_prices, :price_concurrent
    add_reference :hotel_types, :origin, foreign_key: true, null: false
    add_reference :month_prices, :origin, foreign_key: true
    add_column :month_prices, :year, :integer
  end
end
