class CreateWorkshopRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :workshop_registrations do |t|
      t.references :workshop, foreign_key: true
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
