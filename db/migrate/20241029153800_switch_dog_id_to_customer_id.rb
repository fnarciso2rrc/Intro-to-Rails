class SwitchDogIdToCustomerId < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :dog_id, :integer
    add_column :dogs, :customer_id, :integer, foreign_key: true
  end
end
