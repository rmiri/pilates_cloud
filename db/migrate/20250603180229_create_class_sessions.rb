# frozen_string_literal: true

class CreateClassSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :class_sessions do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :studio, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
