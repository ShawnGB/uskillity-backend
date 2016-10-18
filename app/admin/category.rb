ActiveAdmin.register Category, as: "CourseCategory" do
  actions :all, except: [:destroy, :create, :new]
  permit_params :name_en, :name_de, :action_word_en, :action_word_en, :parent_id, :image

  translated_attributes = ['name', 'action_word']
  divine_attributes = ["id", "created_at", "updated_at"]
  regular_attributes = ["parent_id", "image"]

  index do
    selectable_column
    column :parent_id
    column :name_de
    column :name_en
    column :image
    column :action_word_de
    column :action_word_en
    actions
  end

  show do
    attributes_table do
      divine_attributes.each do |entry|
        row entry.to_sym
      end
      translations(translated_attributes).each do |entry|
        row entry.to_sym
      end
      regular_attributes.each do |entry|
        row entry.to_sym
      end
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs "Category Details" do
      translations(translated_attributes).each do |entry|
        f.input entry
      end

      regular_attributes.each do |entry|
        f.input entry
      end
    end

    f.actions
  end

end
