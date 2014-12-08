class CreateDisasters < ActiveRecord::Migration
  def change
    create_table :disasters do |t|
      t.string :title
      t.string :desc
      t.string :original_id

      t.timestamps
    end
  end
end
