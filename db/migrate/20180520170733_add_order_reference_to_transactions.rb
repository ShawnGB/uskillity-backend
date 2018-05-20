class AddOrderReferenceToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :order_id, :bigint
  end
end
