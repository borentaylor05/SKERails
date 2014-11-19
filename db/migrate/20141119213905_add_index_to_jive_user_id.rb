class AddIndexToJiveUserId < ActiveRecord::Migration
  def change
  	add_index :users, :jive_user_id
  end
end
