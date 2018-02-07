class AddTermsAcceptedToWorkshop < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :terms_accepted, :boolean
  end
end
