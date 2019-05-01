class CreateHotelTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_types do |t|
      t.string :name
      t.references :hotel_site, null: false, foreign_key: true
      t.integer :year
      t.string :link

      t.timestamps
    end
  end
end
