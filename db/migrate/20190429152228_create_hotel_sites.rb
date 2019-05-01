class CreateHotelSites < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_sites do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
