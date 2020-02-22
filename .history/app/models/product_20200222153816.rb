# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :pic
  belongs_to :user
end
