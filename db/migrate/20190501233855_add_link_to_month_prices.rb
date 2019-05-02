class AddLinkToMonthPrices < ActiveRecord::Migration[6.0]
  def change
    add_column :month_prices, :link, :string
  end
end
