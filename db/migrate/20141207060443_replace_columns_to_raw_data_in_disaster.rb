class ReplaceColumnsToRawDataInDisaster < ActiveRecord::Migration
  def change
    remove_columns :disasters, :title
    remove_columns :disasters, :desc
    remove_columns :disasters, :subject
    remove_columns :disasters, :alert_level
    remove_columns :disasters, :latitude
    remove_columns :disasters, :longitude
    add_column :disasters, :raw, :json
  end
end
