class CreateFieldImages < ActiveRecord::Migration[5.2]
  def change
    create_table :field_images do |t|
      t.references :field, foreign_key: true
      t.string :path

      t.timestamps
    end
  end
end
