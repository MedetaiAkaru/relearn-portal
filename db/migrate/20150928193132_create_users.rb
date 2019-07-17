class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :username
      t.string    :name
      t.string    :email
      t.string    :password_digest
      t.string    :github_id
      t.string    :image_url

      t.timestamps null: false
    end
  end
end
