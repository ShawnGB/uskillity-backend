class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.text :dummy

      t.timestamps
    end
  end
end
