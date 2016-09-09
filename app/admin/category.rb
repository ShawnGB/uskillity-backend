ActiveAdmin.register Category, as: "CourseCategory" do
  actions :all, except: [:destroy, :create, :new]
end
