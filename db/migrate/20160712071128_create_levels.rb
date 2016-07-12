class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.hstore :name_translations
      t.integer :value
      t.boolean :is_active

      t.timestamps
    end
    add_index :levels, :value, unique: true
  end
end
