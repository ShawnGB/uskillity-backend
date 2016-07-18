ActiveAdmin.register Rating do
  actions :all, except: [:new, :create, :edit, :destroy, :create]
end
