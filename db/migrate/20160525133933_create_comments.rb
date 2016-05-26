class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :blog, index: true, foreign_key: true
      t.text :data

      t.timestamps null: false
    end
  end
end
