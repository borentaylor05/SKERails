class RenameTypeInTab < ActiveRecord::Migration
  def change
  	rename_column :tabs, :type, :tab_type
  end
end
