class AddCoreToCohort < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :core_id, :integer
    add_column :cohorts, :duration_in_weeks, :integer
    add_column :cohorts, :day_of_week, :integer
  end
end
