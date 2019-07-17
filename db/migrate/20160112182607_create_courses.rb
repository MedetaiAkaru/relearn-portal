class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :short_name
      t.string :format

      t.timestamps null: false
    end
  end
end
