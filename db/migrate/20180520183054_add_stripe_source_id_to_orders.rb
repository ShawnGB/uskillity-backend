class AddStripeSourceIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :stripe_source, :string
  end
end
