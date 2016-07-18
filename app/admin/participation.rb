ActiveAdmin.register Participation do
  actions :all, except: [:new, :create, :edit, :destroy, :create]
end
