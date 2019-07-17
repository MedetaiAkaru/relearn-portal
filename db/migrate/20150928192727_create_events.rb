class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.belongs_to :group
      t.timestamps null: false
    end
  end
end
