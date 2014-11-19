class AddHostToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :host, :string
  end
end
