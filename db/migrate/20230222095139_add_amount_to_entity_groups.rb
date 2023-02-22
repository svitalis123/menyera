class AddAmountToEntityGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :entity_groups, :amount, :decimal
  end
end
