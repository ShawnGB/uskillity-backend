ActiveAdmin.register WorkshopSession do
  permit_params :title_en, :title_de, :subtitle_en, :subtitle_de, :description_en, :description_de, :starts_at, :ends_at, :level_id, :main_image, :more_images, :tutor_id, :workshop_id, :venue_id, :minimum_participation_count, :maximum_participation_count
  translated_attributes = %w[title subtitle description]
  regular_attributes = %w[starts_at ends_at level_id main_image more_images tutor_id venue_id minimum_participation_count maximum_participation_count workshop]
  divine_attributes = %w[id created_at updated_at]

  index do
    selectable_column
    column :id
    column :workshop
    column :starts_at
    column :ends_at
    column :title_en
    column :title_de
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

    f.inputs "Workshop Session Details" do
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
