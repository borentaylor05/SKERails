class AddIndexToHost < ActiveRecord::Migration
  def change
  	add_index :clients, :host
  end
end
