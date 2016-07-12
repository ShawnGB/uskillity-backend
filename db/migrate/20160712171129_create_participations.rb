class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references :workshop_session, foreign_key: true
      t.references :workshop_registration, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
