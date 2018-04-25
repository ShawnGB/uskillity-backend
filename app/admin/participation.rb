ActiveAdmin.register Participation do
  actions :all, except: [:new, :create, :edit]

  index do
    selectable_column
    column :id
    column :user
    actions
  end

end
