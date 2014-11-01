class AddEndedToCall < ActiveRecord::Migration
  def change
  	add_column :calls, :ended, :boolean
  end
end
