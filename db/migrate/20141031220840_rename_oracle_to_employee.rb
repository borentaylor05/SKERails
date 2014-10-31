class RenameOracleToEmployee < ActiveRecord::Migration
  def change
  	remove_column :users, :oracle_id
    add_column :users, :employee_id, :string
  end
end
