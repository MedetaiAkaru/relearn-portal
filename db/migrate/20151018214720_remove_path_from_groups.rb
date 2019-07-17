class RemovePathFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :path, :string
  end
end
