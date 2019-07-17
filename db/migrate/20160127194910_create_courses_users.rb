class CreateCoursesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_users do |t|
      t.references :course
      t.references :user
    end
  end
end
