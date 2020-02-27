class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :full_adress
      t.string :district
      t.string :city
      t.integer :type

      t.timestamps
    end
  end
end
