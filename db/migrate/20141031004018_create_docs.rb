class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :title
      t.string :doc_num

      t.timestamps null: false
    end
  end
end
