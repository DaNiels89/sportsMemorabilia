# frozen_string_literal: true

class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :user_id, :integer
  end
end
