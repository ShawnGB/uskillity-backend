class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.hstore :title_translations
      t.hstore :subtitle_translations
      t.hstore :description_translations
      t.references :category, foreign_key: true
      t.date :offered_on, array: true, default: []
      t.float :fees
      t.references :provider, foreign_key: {to_table: :users}
      t.string :main_image
      t.string :more_images, array: true, default: []
      t.boolean :is_recurring
      t.integer :recurrence_type
      t.boolean :is_approved, default: false
      t.integer :minimum_workshop_registration_count, default: 0
      t.integer :maximum_workshop_registration_count

      t.timestamps
    end
  end
end
