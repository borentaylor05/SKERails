class ChangeCallTimeNames < ActiveRecord::Migration
  def change
  	rename_column :calls, :begin, :start_time
  	rename_column :calls, :end, :end_time
  end
end
