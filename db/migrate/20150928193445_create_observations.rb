class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :status
      t.text :body
      t.belongs_to :observee, :class_name => "membership"
      t.belongs_to :author, :class_name => "membership"
      t.belongs_to :observee
      t.belongs_to :author


      t.timestamps null: false
    end
  end
end
