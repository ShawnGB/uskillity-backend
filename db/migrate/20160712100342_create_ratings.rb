class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.float :value
      t.references :creator, foreign_key: {to_table: :users}
      t.references :rated_object, polymorphic: true

      t.timestamps
    end
  end
end
