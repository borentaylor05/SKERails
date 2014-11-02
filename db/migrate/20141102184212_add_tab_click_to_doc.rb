class AddTabClickToDoc < ActiveRecord::Migration
  def change
  	add_column :docs, :tab_click, :boolean
  end
end
