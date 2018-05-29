class AddOrderReferenceToParticipations < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :order_id, :bigint
  end
end
