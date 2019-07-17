class RemoveOrphanedMemberships < ActiveRecord::Migration[5.2]
  def up
    Membership.where(cohort: nil).destroy_all
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
