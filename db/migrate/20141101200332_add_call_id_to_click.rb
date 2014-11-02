class AddCallIdToClick < ActiveRecord::Migration
  def change
  	add_column :clicks, :call_id, :integer
  end
end
