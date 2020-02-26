class CreateFacilityImages < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_images do |t|
      t.references :facility, foreign_key: true
      t.string :path

      t.timestamps
    end
  end
end
