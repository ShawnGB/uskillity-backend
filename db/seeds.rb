# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name_en: 'Business',
                name_de: 'Das Unternehmen',
                image: '/assets/categories/business-1012761_1920.png',
                action_word_en: 'grow',
                action_word_de: 'wachsen'
               )
Category.create(name_en: 'Tech & Science',
                name_de: 'Technologie&Wissenschaft',
                image: '/assets/categories/robot-507811_1920.png',
                action_word_en: 'discover',
                action_word_de: 'entdecken'
               )
Category.create(name_en: 'Creative & Arts',
                name_de: 'Kreative und Kunst.',
                image: '/assets/categories/brush-1683134_1920.png',
                action_word_en: 'create',
                action_word_de: 'basteln'
               )
Category.create(name_en: 'Lifestyle',
                name_de: 'Lebensstil.',
                image: '/assets/categories/legs-434918_1280.png',
                action_word_en: 'enjoy',
                action_word_de: 'genießen'
               )
Category.create(name_en: 'Kids',
                name_de: 'Kinder',
                image: '/assets/categories/kids.png',
                action_word_en: 'play',
                action_word_de: 'spielen'
               )
Category.create(name_en: 'Tutoring',
                name_de: 'Unterrichten',
                image: '/assets/categories/children-286239_1920.png',
                action_word_en: 'nurture',
                action_word_de: 'fördern'
               )

Level.create([
  {value: 0, name_de: 'Neuling', name_en: 'Novice'},
  {value: 20, name_de: 'Anfänger', name_en: 'Beginner'},
  {value: 40, name_de: 'Fortgeschrittene Anfänger', name_en: 'Advanced Beginner'},
  {value: 60, name_de: 'Kompetant', name_en: 'Knowledgeable'},
  {value: 80, name_de: 'Expert', name_en: 'Expert'},
  {value: 100, name_de: 'Guru', name_en: 'Guru'}
])

User.create([
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_boy_face.png", password: Faker::Internet.password(10, 20)},
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_grandma_hat.png", password: Faker::Internet.password(10, 20)},
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_lady_close_up.png", password: Faker::Internet.password(10, 20)},
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_old_man.png", password: Faker::Internet.password(10, 20)},
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_pyramid_hair_man.png", password: Faker::Internet.password(10, 20)},
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_shy_lady.png", password: Faker::Internet.password(10, 20)},
  {email: Faker::Name.last_name + '@example.com', name: Faker::Name.last_name, first_name: Faker::Name.first_name, locale: "de", image: "/assets/profile/200x200_soph_lady.png", password: Faker::Internet.password(10, 20)}
])

Workshop.create(title_en: 'Communication',
                title_de: 'Kommunikation',
                subtitle_en: 'Get communicative',
                subtitle_de: 'Besser kommunizieren',
                action_word: 'communicate',
                provider: User.all.sample,
                main_image: '/assets/workshops/workplace-1245776_1920.jpg')
Workshop.create(title_en: 'Marketing',
                title_de: 'Marketing',
                subtitle_en: 'Marketing',
                subtitle_de: 'Marketing',
                action_word: 'Marketing',
                provider: User.all.sample,
                main_image: '/assets/workshops/business-1676138_1920.jpg')
Workshop.create(title_en: 'Management',
                title_de: 'Management',
                subtitle_en: 'Management',
                subtitle_de: 'Management',
                action_word: 'Management',
                provider: User.all.sample,
                main_image: '/assets/workshops/work-management-907669_1280.jpg')
Workshop.create(title_en: 'Business Planning',
                title_de: 'Business Planning',
                subtitle_en: 'Business Planning',
                subtitle_de: 'Business Planning',
                action_word: 'Business Planning',
                provider: User.all.sample,
                main_image: '/assets/workshops/hand-895588_1920.jpg')
Workshop.create(title_en: 'Strategic Planning',
                title_de: 'Strategic Planning',
                subtitle_en: 'Strategic Planning',
                subtitle_de: 'Strategic Planning',
                action_word: 'Strategic Planning',
                provider: User.all.sample,
                main_image: '/assets/workshops/the-strategy-1080527.jpg')
Workshop.create(title_en: 'Programming',
                title_de: 'Programming',
                subtitle_en: 'Programming',
                subtitle_de: 'Programming',
                action_word: 'Programming',
                provider: User.all.sample,
                main_image: '/assets/workshops/monitor-933392.jpg')
Workshop.create(title_en: 'App Development',
                title_de: 'App Development',
                subtitle_en: 'App Development',
                subtitle_de: 'App Development',
                action_word: 'App Development',
                provider: User.all.sample,
                main_image: '/assets/workshops/tablet-1616460.jpg')
Workshop.create(title_en: 'Adobe Workshops',
                title_de: 'Adobe Workshops',
                subtitle_en: 'Adobe Workshops',
                subtitle_de: 'Adobe Workshops',
                action_word: 'Adobe Workshops',
                provider: User.all.sample,
                main_image: '/assets/workshops/adobe-24943.png')
Workshop.create(title_en: 'Coding',
                title_de: 'Coding',
                subtitle_en: 'Coding',
                subtitle_de: 'Coding',
                action_word: 'Coding',
                provider: User.all.sample,
                main_image: '/assets/workshops/laptop-926775.jpg')
Workshop.create(title_en: 'Maths',
                title_de: 'Maths',
                subtitle_en: 'Maths',
                subtitle_de: 'Maths',
                action_word: 'Maths',
                provider: User.all.sample,
                main_image: '/assets/workshops/math-1547018.jpg')
Workshop.create(title_en: 'Chemistry',
                title_de: 'Chemistry',
                subtitle_en: 'Chemistry',
                subtitle_de: 'Chemistry',
                action_word: 'Chemistry',
                provider: User.all.sample,
                main_image: '/assets/workshops/chemistry-740453.jpg')
Workshop.create(title_en: 'Auto Mechanics',
                title_de: 'Auto Mechanics',
                subtitle_en: 'Auto Mechanics',
                subtitle_de: 'Auto Mechanics',
                action_word: 'Auto Mechanics',
                provider: User.all.sample,
                main_image: '/assets/workshops/car-1564296.jpg')
Workshop.create(title_en: 'Mechanical Engineering',
                title_de: 'Mechanical Engineering',
                subtitle_en: 'Mechanical Engineering',
                subtitle_de: 'Mechanical Engineering',
                action_word: 'Mechanical Engineering',
                provider: User.all.sample,
                main_image: '/assets/workshops/gears-1359431.jpg')
Workshop.create(title_en: 'Gas Turbine Engineering',
                title_de: 'Gas Turbine Engineering',
                subtitle_en: 'Gas Turbine Engineering',
                subtitle_de: 'Gas Turbine Engineering',
                action_word: 'Gas Turbine Engineering',
                provider: User.all.sample,
                main_image: '/assets/workshops/turbine-1516081.jpg')
Workshop.create(title_en: 'Sculpting',
                title_de: 'Sculpting',
                subtitle_en: 'Sculpting',
                subtitle_de: 'Sculpting',
                action_word: 'Sculpting',
                provider: User.all.sample,
                main_image: '/assets/workshops/clay-690404.jpg')
Workshop.create(title_en: 'Knitting',
                title_de: 'Knitting',
                subtitle_en: 'Knitting',
                subtitle_de: 'Knitting',
                action_word: 'Knitting',
                provider: User.all.sample,
                main_image: '/assets/workshops/wool-480550.jpg')
Workshop.create(title_en: 'Media',
                title_de: 'Media',
                subtitle_en: 'Media',
                subtitle_de: 'Media',
                action_word: 'Media',
                provider: User.all.sample,
                main_image: '/assets/workshops/film-1668917.jpg')
Workshop.create(title_en: 'Music',
                title_de: 'Music',
                subtitle_en: 'Music',
                subtitle_de: 'Music',
                action_word: 'Music',
                provider: User.all.sample,
                main_image: '/assets/workshops/country-946706.jpg')
Workshop.create(title_en: 'Fashion',
                title_de: 'Fashion',
                subtitle_en: 'Fashion',
                subtitle_de: 'Fashion',
                action_word: 'Fashion',
                provider: User.all.sample,
                main_image: '/assets/workshops/fashion-1636868.jpg')
Workshop.create(title_en: 'Creative Writing',
                title_de: 'Creative Writing',
                subtitle_en: 'Creative Writing',
                subtitle_de: 'Creative Writing',
                action_word: 'Creative Writing',
                provider: User.all.sample,
                main_image: '/assets/workshops/home-office-336378.jpg')
Workshop.create(title_en: 'Fitness',
                title_de: 'Fitness',
                subtitle_en: 'Fitness',
                subtitle_de: 'Fitness',
                action_word: 'Fitness',
                provider: User.all.sample,
                main_image: '/assets/workshops/yoga-241609.jpg')
Workshop.create(title_en: 'Ballet',
                title_de: 'Ballet',
                subtitle_en: 'Ballet',
                subtitle_de: 'Ballet',
                action_word: 'Ballet',
                provider: User.all.sample,
                main_image: '/assets/workshops/ballet-1553359.jpg')
Workshop.create(title_en: 'Gardening',
                title_de: 'Gardening',
                subtitle_en: 'Gardening',
                subtitle_de: 'Gardening',
                action_word: 'Gardening',
                provider: User.all.sample,
                main_image: '/assets/workshops/dahlia-1706411.jpg')
Workshop.create(title_en: 'Family',
                title_de: 'Family',
                subtitle_en: 'Family',
                subtitle_de: 'Family',
                action_word: 'Family',
                provider: User.all.sample,
                main_image: '/assets/workshops/family-932245.jpg')
Workshop.create(title_en: 'Cross Fit',
                title_de: 'Cross Fit',
                subtitle_en: 'Cross Fit',
                subtitle_de: 'Cross Fit',
                action_word: 'Cross Fit',
                provider: User.all.sample,
                main_image: '/assets/workshops/cross-fit-1127012.jpg')
