FactoryGirl.define do
  factory :workshop do
    title_en "Vestibulum accumsan felis posuere, auctor ligul. Nam ac est sed magna maximus placerat mattis nec enim."
    subtitle_en "Proin gravida blandit ultricies. Vestibulum ac fringilla arcu, at consectetur arcu. Nunc imperdie"
    description_en "Sed eleifend nisl orci, id scelerisque felis molestie id. Mauris placerat diam non neque euismod, id. auctor ligula in, feugiat turpis. Aenean ut risus iaculis auctor ligula in, feugiat turpis. Aenean ut risus iaculis"
    title_de "Maecenas sollicitudin, lorem interdum placerat auctor, velit nisi feugiat leo, id efficitur libero ante non eros."
    subtitle_de "Maecenas sollicitudin, lorem interdum placerat auctor, velit nisi feugiat leo, id efficitur libero ante non eros."
    description_de "Proin gravida blandit ultricies. Vestibulum ac fringilla arcu, at consectetur arcu. Nunc imperdie. auctor ligula in, feugiat turpis. Aenean ut risus iaculis auctor ligula in, feugiat turpis. Aenean ut risus iaculis"
    association :category, factory: :category
    offered_on "2016-07-12"
    fees 1.5
    association :provider, factory: :user
    main_image "MyString"
    more_images "MyString"
  end
end
