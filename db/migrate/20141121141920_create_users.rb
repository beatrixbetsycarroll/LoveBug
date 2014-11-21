class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name

      t.string  :email
      t.string  :user_name
      t.string  :password_digest

      t.string  :location
      t.string  :hair_color
      t.string  :eye_color
      t.string  :race #physical appearance
      t.string  :religion
      t.integer :age
      t.text    :about
      t.string  :photo
      t.integer :height
      t.integer :weight
    end
  end
end
