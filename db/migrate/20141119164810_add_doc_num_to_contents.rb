class AddDocNumToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :doc_num, :string
  end
end
