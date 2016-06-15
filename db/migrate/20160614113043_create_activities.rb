class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type
      t.boolean :approved
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
