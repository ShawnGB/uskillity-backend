class AddStripeConnectionTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stripe_connection_token, :string
  end
end
