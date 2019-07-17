class AddColumnToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :base_score, :integer 
  end
end
