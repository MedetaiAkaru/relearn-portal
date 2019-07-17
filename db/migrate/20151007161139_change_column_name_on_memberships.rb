class ChangeColumnNameOnMemberships < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :is_admin?, :is_admin
  end
end
