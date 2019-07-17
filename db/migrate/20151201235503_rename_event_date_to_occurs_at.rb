class RenameEventDateToOccursAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :date, :occurs_at
  end
end
