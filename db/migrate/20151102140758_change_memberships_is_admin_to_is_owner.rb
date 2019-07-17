class ChangeMembershipsIsAdminToIsOwner < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :is_admin, :is_owner
  end
end
