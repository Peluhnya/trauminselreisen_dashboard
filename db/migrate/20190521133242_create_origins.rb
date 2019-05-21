class CreateOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :origins do |t|
      t.string :name
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
