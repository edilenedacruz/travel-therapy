class CreateCountry < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :country_id
      t.string :country
      t.string :city
      t.string :latitude
      t.string :longitude
    end
  end
end
