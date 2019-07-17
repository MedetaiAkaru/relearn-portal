class AddInviteCodeToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :invite_code, :string
  end
end
