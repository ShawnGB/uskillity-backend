class AddMinAgeAndMaxAgeToWorkshop < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :min_age, :integer
    add_column :workshops, :max_age, :integer
  end
end
