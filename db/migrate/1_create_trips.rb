# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :uid
      t.string :name
      t.time :departure_date
      t.time :arrival_date

      t.timestamps
    end
  end
end
