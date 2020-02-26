class AddUserTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_type, :integer
    add_column :users, :last_login_date, :timestamp
  end
end
