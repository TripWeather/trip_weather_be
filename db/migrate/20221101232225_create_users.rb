# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :token
      t.string :email
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :image

      t.timestamps
    end
  end
end
