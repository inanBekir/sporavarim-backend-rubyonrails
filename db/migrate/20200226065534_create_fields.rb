class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.references :facility, foreign_key: true
      t.string :name
      t.integer :type

      t.timestamps
    end
  end
end
