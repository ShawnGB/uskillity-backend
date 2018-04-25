ActiveAdmin.register Workshop do

  permit_params :title_en, :title_de, :subtitle_en, :subtitle_de, :description_en, :description_de, :category_id, :level_id, :provider_id, :main_image, :more_images, :minimum_workshop_registration_count, :maximum_workshop_registration_count, :action_word, :is_approved, :fees
  translated_attributes = %w[title subtitle description]
  regular_attributes = %w[category_id level_id is_approved fees provider_id main_image more_images minimum_workshop_registration_count maximum_workshop_registration_count action_word]
  divine_attributes = %w[id created_at updated_at]
  # ignored_attributes = %w[offered_on is_approved is_recurring recurrence_type price]

  index do
    selectable_column
    column :id
    column :title_en
    column :title_de
    column :category_id
    column :fees
    column :provider_id
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

    panel "Sessions" do
      table_for workshop.workshop_sessions do
        column "Session" do |session|
          link_to session.id.to_s, admin_workshop_session_path(session.id)
        end
        column "Starts At" do |session|
            session.starts_at
        end
        column "Ends At" do |session|
          session.ends_at
        end
      end
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs "Workshop Details" do
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
