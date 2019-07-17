class AddRequiredToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :required, :boolean
  end
end
