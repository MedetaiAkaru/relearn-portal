class RenameIsOwnerToIsAdminOnMemberships < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :is_owner, :is_admin
  end
end
