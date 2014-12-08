class AddExtraToDisaster < ActiveRecord::Migration
  def change
    add_column :disasters, :subject, :string
    add_column :disasters, :alert_level, :string
    add_column :disasters, :latitude, :float
    add_column :disasters, :longitude, :float
  end
end
