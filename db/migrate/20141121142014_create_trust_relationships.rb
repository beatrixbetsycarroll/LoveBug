class CreateTrustRelationships < ActiveRecord::Migration
  def change
    create_table :trust_relationships do |t|
      t.references  :user_a
      t.references  :user_b

      t.timestamps
    end
  end
end
