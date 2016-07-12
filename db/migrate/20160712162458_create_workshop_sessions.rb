class CreateWorkshopSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :workshop_sessions do |t|
      t.hstore :title_translations
      t.hstore :subtitle_translations
      t.hstore :description_translations
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :level, foreign_key: true
      t.string :main_image
      t.string :more_images, array: true, default: []
      t.references :tutor, foreign_key: {to_table: :users}
      t.references :workshop, foreign_key: true
      t.references :venue, foreign_key: true
      t.integer :minimum_participation_count, default: 0
      t.integer :maximum_participation_count

      t.timestamps
    end
  end
end
