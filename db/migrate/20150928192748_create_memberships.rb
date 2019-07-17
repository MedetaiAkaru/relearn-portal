class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.boolean :is_admin?
      t.timestamps null: false
    end
  end
end
