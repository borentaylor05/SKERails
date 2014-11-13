class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.string :link
      t.integer :subtopic_id
      t.boolean :native
      t.string :original_doc
      t.string :summary

      t.timestamps null: false
    end
  end
end
