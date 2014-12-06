class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :country
      t.references :user, index: true
      t.references :disaster, index: true

      t.timestamps
    end
  end
end
