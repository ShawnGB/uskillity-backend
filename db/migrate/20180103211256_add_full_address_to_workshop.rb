class AddFullAddressToWorkshop < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :full_address, :text
  end
end
