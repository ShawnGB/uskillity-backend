ActiveAdmin.register Category, as: "CourseCategory" do
  actions :all, except: [:edit, :destroy, :create, :new]
end
