class AddAdditionalRequirementsToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :additional_requirements_translations, :hstore
  end
end
