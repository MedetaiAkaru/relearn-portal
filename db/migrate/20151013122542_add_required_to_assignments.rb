class AddRequiredToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :required, :boolean
  end
end
