class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :user_id
      t.datetime :begin
      t.datetime :end

      t.timestamps null: false
    end
  end
end
