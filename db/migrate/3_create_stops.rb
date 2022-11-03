# frozen_string_literal: true

class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.belongs_to :trip, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.string :type_of_stop
    end
  end
end
