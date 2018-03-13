class AddStripeFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stripe_publishable_key, :string
    add_column :users, :stripe_provider, :string
    add_column :users, :stripe_uid, :string
    add_column :users, :stripe_access_code, :string
  end
end
