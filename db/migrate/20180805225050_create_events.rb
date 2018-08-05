class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.references :organization, foreign_key: true
      
      t.timestamps
      
    end
  end
end
