ActiveAdmin.register Workshop do

  translated_attributes = %w[title subtitle description]
  regular_attributes = %w[category]
  bool_attributes = %w[is_approved]
  image_attributes = %w[main_image]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Admin Details" do
      translations(translated_attributes).each do |entry|
        f.input entry
      end
      inputs_for_regular_attributes(f, regular_attributes)
      bool_attributes.each do |entry|
        f.input entry.to_sym
      end
      image_attributes.each do |entry|
        f.input entry.to_sym
      end
    end

    f.actions
  end


end
