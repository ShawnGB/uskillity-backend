# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tech = Category.create(name_de: 'Technologie', name_en: 'Technology')
Category.create(name_de: 'Programmierung', name_en: 'Programming', parent: tech)

arts = Category.create(name_de: 'Kunst', name_en: 'Arts')
dance = Category.create(name_de: 'Tanzen', name_en: 'Dancing', parent: arts)
Category.create(name_de: 'Salsa', name_en: 'Salsa', parent: dance)
Category.create(name_de: 'Gitarre', name_en: 'Guitar', parent: arts)

