class CreateUserStds < ActiveRecord::Migration
  def change
    create_table :user_stds do |t|
      t.references  :user
      t.references  :std

      t.timestamps
  end
end
