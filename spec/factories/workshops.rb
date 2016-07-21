FactoryGirl.define do
  factory :workshop do
    title_en "en - " + Faker::Lorem.words.join(" ")
    subtitle_en "en - " + Faker::Lorem.words(5).join(" ")
    description_en "en - " + Faker::Lorem.sentences(7).join(" ")
    title_de "de - " + Faker::Lorem.words.join(" ")
    subtitle_de "de - " + Faker::Lorem.words(5).join(" ")
    description_de "de - " + Faker::Lorem.sentences(7).join(" ")
    association :category, factory: :category
    offered_on "2016-07-12"
    fees 1.5
    association :provider, factory: :user
    main_image "http://placehold.it/350x250"
    more_images "MyString"
    price 59
  end
end
