class ChangeDescFromStringToTextInDisaster < ActiveRecord::Migration
  def change
    change_column :disasters, :desc, :text
  end
end
