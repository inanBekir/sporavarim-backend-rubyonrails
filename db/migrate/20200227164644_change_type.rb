class ChangeType < ActiveRecord::Migration[5.2]
  def change
    rename_column :facilities, :type, :facility_type
  end
end
