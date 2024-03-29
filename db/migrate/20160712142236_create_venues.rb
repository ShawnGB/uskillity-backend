class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :street
      t.string :house_number
      t.string :city
      t.string :state
      t.string :zip
      t.string :country_alpha2
      t.float :longitude
      t.float :latitude
      t.string :room_number
      t.string :extra_infomation

      t.timestamps
    end
  end
end
