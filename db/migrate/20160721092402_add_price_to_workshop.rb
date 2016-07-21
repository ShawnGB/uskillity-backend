class AddPriceToWorkshop < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :price, :float
  end
end
