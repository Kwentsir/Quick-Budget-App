# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :name, presence: true, length: { in: 4..250 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
