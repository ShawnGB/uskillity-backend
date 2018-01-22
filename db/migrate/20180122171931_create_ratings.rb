class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :rating
      t.references :creator, foreign_key: {to_table: :users}
      t.references :rated, polymorphic: true

      t.timestamps
    end
  end
end
