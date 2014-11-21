class CreateStds < ActiveRecord::Migration
  def change
    create_table :stds do |t|
      t.string  :name
      t.timestamps
    end
  end
end
