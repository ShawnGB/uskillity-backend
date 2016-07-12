FactoryGirl.define do
  factory :comment do
    text "MyText"
    commenter nil
    lang 1
    commented_object nil
  end
end
