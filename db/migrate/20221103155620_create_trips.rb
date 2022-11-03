class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :uid
      t.string :name
      t.string :start_point
      t.string :end_point
      t.string :start_time
      t.string :departure_date

      t.timestamps
    end
  end
end
