class AddIsCancelledToParticipations < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :is_cancelled, :boolean
  end
end
