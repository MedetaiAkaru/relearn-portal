class ChangeColumnInAssignment < ActiveRecord::Migration[5.2]
  def change
    change_column :assignments, :public, :boolean, :default => false
  end
end
