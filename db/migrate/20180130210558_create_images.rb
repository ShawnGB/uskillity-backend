class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text :url
      t.references :of, polymorphic: true
      t.references :user, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
