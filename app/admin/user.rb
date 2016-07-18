ActiveAdmin.register User do
	actions :all, except: [:edit, :destroy, :create, :new]

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
end
