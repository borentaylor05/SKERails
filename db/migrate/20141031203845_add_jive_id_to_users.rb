class AddJiveIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :jive_user_id, :string
  end
end
