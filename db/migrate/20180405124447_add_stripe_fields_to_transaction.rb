class AddStripeFieldsToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :paid, :boolean, default: false
    add_column :transactions, :stripe_charge, :string
  end
end
