class CreateSecondaryTopics < ActiveRecord::Migration
  def change
    create_table :secondary_topics do |t|
      t.string :name
      t.integer :primary_id

      t.timestamps null: false
    end
  end
end
