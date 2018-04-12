class AddFeeToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :fee_charged, :decimal, {:precision=>8, :scale=>2, :default=>0.0}
  end
end
