# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
  end
end
