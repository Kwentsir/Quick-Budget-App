# frozen_string_literal: true

class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
  has_many :entities, foreign_key: :author_id, dependent: :destroy
  has_many :groups, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true, length: { in: 4..250 }
end
