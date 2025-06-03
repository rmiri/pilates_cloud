# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :class_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
