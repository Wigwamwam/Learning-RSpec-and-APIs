# frozen_string_literal: true

class Model < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  belongs_to :brand

  validates :name, presence: true
end
