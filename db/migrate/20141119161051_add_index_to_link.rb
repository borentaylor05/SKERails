class AddIndexToLink < ActiveRecord::Migration
  def change
  	add_index :contents, :link
  end
end
