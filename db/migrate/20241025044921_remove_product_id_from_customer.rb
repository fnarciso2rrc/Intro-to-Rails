class RemoveProductIdFromCustomer < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :product_id, :integer
  end
end
