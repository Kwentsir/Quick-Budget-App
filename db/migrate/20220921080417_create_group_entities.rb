# frozen_string_literal: true

# This migration is group_entities table
class CreateGroupEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :group_entities, &:timestamps
  end
end
