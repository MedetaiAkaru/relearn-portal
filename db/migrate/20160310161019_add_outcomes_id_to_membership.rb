class AddOutcomesIdToMembership < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :outcomes_id, :integer
  end
end
