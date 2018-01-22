class AddPublishedAtToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :published_at, :datetime
  end
end
