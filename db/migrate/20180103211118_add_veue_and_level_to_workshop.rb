class AddVeueAndLevelToWorkshop < ActiveRecord::Migration[5.1]
  def change
    add_reference :workshops, :venue, foreign_key: true
    add_reference :workshops, :level, foreign_key: true
  end
end
