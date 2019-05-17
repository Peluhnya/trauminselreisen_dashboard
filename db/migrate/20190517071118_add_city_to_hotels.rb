class AddCityToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :city, :string
  end
end
