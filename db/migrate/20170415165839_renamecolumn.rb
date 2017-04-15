class Renamecolumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :countries, :country_id, :city_id
  end
end
