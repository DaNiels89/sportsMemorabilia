# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :material
      t.string :size
      t.string :player
      t.decimal :price

      t.timestamps
    end
  end
end
