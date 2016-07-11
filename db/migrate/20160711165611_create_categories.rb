class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.integer :parent_id, foreign_key: true
      t.hstore :name_translations

      t.timestamps
    end
  end
end
