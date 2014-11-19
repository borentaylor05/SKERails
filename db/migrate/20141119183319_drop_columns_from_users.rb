class DropColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :username
  	remove_column :users, :employee_id
  end
end
