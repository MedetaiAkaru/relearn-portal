class AddPathToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :path, :string
  end
end
