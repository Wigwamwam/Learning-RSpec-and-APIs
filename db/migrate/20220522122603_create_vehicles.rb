# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :legal_identifier
      t.string :name
      t.integer :frame_size
      t.integer :status
      t.references :model, index: true, foreign_key: true

      t.timestamps
    end
  end
end
