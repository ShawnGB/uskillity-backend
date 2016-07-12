class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :commenter, foreign_key: {to_table: :users}
      t.integer :lang
      t.references :commented_object, polymorphic: true

      t.timestamps
    end
  end
end
