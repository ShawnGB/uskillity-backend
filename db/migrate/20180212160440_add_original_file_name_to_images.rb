class AddOriginalFileNameToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :original_filename, :string
  end
end
