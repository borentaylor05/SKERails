class AddPolymorphAttributesToClick < ActiveRecord::Migration
  def change
  	add_column :clicks, :action_type, :string
  	add_column :clicks, :action_id, :integer

    add_index :clicks, [:action_id, :action_type]
  end
end
