class AddSecondaryIdToSubtopic < ActiveRecord::Migration
  def change
  	add_column :subtopics, :secondary_id, :integer
  end
end
