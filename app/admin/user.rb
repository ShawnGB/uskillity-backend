ActiveAdmin.register User do
  permit_params :email, :password, :name, :firstname
  actions :all, except: [:destroy]

	index do
		selectable_column
		id_column
		column 'Name' do |user|
			"#{user.first_name} #{user.name}"
		end
		column :email
		column :validated
		column :sign_in_count
		column :current_sign_in_at
		column :last_sign_in_at
		column :failed_attempts
		column :reset_password_sent_at

		actions
	end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "User Details" do
      f.input :name
      f.input :first_name
      f.input :email
      f.input :password
    end
    f.actions
  end
end
