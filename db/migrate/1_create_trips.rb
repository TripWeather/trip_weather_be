# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :uid
      t.string :name
      t.timestamp :departure_date
      t.timestamp :arrival_date

      t.timestamps
    end
  end
end
