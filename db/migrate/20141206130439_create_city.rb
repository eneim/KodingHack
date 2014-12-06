class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :original_id
      t.float :latitude
      t.float :longitude
      t.string :name
    end
  end
end
