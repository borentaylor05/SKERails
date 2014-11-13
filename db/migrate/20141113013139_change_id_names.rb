class ChangeIdNames < ActiveRecord::Migration
  def change
  	rename_column :secondary_topics, :primary_id, :primary_topic_id
  	rename_column :subtopics, :secondary_id, :secondary_topic_id
  	
  end
end
