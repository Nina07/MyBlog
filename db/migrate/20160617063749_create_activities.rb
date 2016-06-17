class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :user_activity_id
      t.string :user_activity_type

      t.timestamps null: false
    end
  end
end
