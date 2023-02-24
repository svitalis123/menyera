# frozen_string_literal: true

class CreateJoinTableGroupEntity < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :entities do |t|
      t.index %i[group_id entity_id]
      t.index %i[entity_id group_id]
    end
  end
end
