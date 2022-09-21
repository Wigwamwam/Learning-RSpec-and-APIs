# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :model
  validates :legal_identifier, :name, :frame_size, :status, presence: true

  validates :frame_size, numericality: { only_integer: true }

  enum status: {
    available: 0, action_required: 1, action_in_progress: 2
  }
end
