class CreateOrganizationMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_members do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :role

      t.timestamps
    end
    add_index :organization_members, [:user_id, :organization_id], unique: true
  end
end
