# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#tech = Category.create(name_de: 'Technologie', name_en: 'Technology', image: '/assets/categories/technology.png')
#Category.create(name_de: 'Programmierung', name_en: 'Programming', parent: tech, image: '/assets/categories/programming.png')

#arts = Category.create(name_de: 'Kunst', name_en: 'Arts', image: '/assets/categories/pottery.png')
#dance = Category.create(name_de: 'Tanzen', name_en: 'Dancing', parent: arts, image: '/assets/categories/dancers.png')
#Category.create(name_de: 'Salsa', name_en: 'Salsa', parent: dance, image: '/assets/categories/latindancers.png')
#Category.create(name_de: 'Gitarre', name_en: 'Guitar', parent: arts, image: '/assets/categories/guitar.png')


Category.create(name_en: 'Business', name_de: 'Das Unternehmen', image: '/assets/categories/business-1012761_1920.png')
Category.create(name_en: 'Tech & Science', name_de: 'Technologie&Wissenschaft', image: '/assets/categories/robot-507811_1920.png')
Category.create(name_en: 'Creative&Arts', name_de: 'Kreative und Kunst.', image: '/assets/categories/brush-1683134_1920.png')
Category.create(name_en: 'Lifestyle', name_de: 'Lebensstil.', image: '/assets/categories/legs-434918_1280.png')
Category.create(name_en: 'Kids', name_de: 'Kinder', image: '/assets/categories/kids.png')
Category.create(name_en: 'Tutoring', name_de: 'Unterrichten', image: '/assets/categories/children-286239_1920.png')


Level.create([
  {value: 0, name_de: 'Neuling', name_en: 'Novice'},
  {value: 20, name_de: 'Anfänger', name_en: 'Beginner'},
  {value: 40, name_de: 'Fortgeschrittene Anfänger', name_en: 'Advanced Beginner'},
  {value: 60, name_de: 'Kompetant', name_en: 'Knowledgeable'},
  {value: 80, name_de: 'Expert', name_en: 'Expert'},
  {value: 100, name_de: 'Guru', name_en: 'Guru'}
])

User.create([
  {email: "adam@example.com", name: 'Eden', first_name: 'Adam', locale: "de", image: "https://upload.wikimedia.org/wikipedia/commons/7/77/Martian_face_viking_cropped.jpg", password: 'needtochange'},
  {email: "eve@example.com", name: 'Eden', first_name: 'Eve', locale: "de", image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Razorjack_collected_edition.jpg", password: 'needtochange'},
])


