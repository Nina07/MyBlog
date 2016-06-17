class AddColumnApprovedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :approved, :boolean, default: 0
  end
end
