class FixOptionMonthPrices < ActiveRecord::Migration[6.0]
  def change
    rename_column :month_prices, :option, :price_option
  end
end
