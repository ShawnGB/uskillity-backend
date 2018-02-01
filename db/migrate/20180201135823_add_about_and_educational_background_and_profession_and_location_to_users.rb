class AddAboutAndEducationalBackgroundAndProfessionAndLocationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :about, :text
    add_column :users, :edu_bg, :string
    add_column :users, :profession, :string
    add_column :users, :location, :string
  end
end
