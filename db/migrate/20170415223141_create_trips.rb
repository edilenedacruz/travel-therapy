class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :city
      t.string :departure_date
      t.string :return_date
    end
  end
end
