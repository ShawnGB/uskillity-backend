class AddColumnActionWordTranslationsToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :action_word_translations, :hstore
  end
end
