# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities, dependent: :destroy

  validates :name, presence: true, length: { in: 4..250 }
  validates :icon, presence: true, length: { in: 4..250 }
end
