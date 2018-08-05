class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :method
      t.float :amount
      t.text :honorific
      t.boolean :paid, default: false
      t.datetime :payment_date
      t.references :user, foreign_key: true
      t.integer :donatable_id
      t.string  :donatable_type
      t.timestamps
    end
  end
end
