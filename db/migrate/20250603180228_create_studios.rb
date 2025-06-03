# frozen_string_literal: true

class CreateStudios < ActiveRecord::Migration[8.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
