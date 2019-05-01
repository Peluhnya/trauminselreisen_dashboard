class CreateMonthPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :month_prices do |t|
      t.string :month
      t.integer :price_concurrent
      t.integer :price
      t.string :option
      t.references :hotel_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
