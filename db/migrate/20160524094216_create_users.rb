class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :address
      t.string :email
      t.string :phone
      t.text :about_user

      t.timestamps null: false
    end
  end
end
