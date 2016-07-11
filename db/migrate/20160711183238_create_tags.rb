class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :text
      t.integer :lang, :null => false

      t.timestamps
    end
  end
end
