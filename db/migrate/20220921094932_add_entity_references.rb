# frozen_string_literal: true

class AddEntityReferences < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    add_reference :group_entities, :group, foreign_key: { to_table: :groups }, index: true
    add_reference :group_entities, :entity, foreign_key: { to_table: :entities }, index: true
  end
end
