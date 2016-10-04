class AddColumnActionWordToWorkshop < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :action_word, :string
  end
end
