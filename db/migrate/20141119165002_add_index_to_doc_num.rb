class AddIndexToDocNum < ActiveRecord::Migration
  def change
  	add_index :contents, :doc_num
  end
end
