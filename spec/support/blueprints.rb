# encoding: UTF-8
require 'machinist/active_record'
require File.expand_path(File.dirname(__FILE__) + '/examples.rb')

User.blueprint do
  email { 'foo@example.com' }
  encrypted_password { '$2a$10$iL0qzYGJxdPhSpRoBIkoWunoKIFLI0kRJBQTXm36QjRxZ9VWtwY2u' }
  name { 'Meyer' }
  first_name { 'Martin' }
  gender { 'male' }
end

Booking.blueprint do
  text { 'example booking' }
end

Category.blueprint  do
  name_de { 'Kochen' }
  name_en { 'Cooking' }
end

Category.blueprint(:asian_cooking) do
  name_de { 'Asiatisch' }
  name_en { 'Asian' }
  parent  { Category.make! }
end

Comment.blueprint do
  text { 'Awesome Workshop!' }
  commenter { User.make! } 
  lang { 1 }
  commented_object_type { 'workshop' }
  commented_object_id { 1 }
end

Level.blueprint do
  name_de { 'Anfänger' }
  name_en { 'Beginner' }
  value { 1 }
  is_active { true }
end

Venue.blueprint do
  street { TestExamples::STREETS[rand(TestExamples::STREETS.size)] }
  house_number { 1 }
  city { TestExamples::TOWNS[rand(TestExamples::TOWNS.size)] }
  zip { '12345' }
end

WorkshopRegistration.blueprint do
  workshop { Workshop.make }
  user { User.make }
  booking { Booking.make }
  status { 1 }
end

Workshop.blueprint do
  title_de { 'Kochen für Anfänger' }
  title_en { 'Cooking for Beginners' }
  subtitle_de { 'Lerne kochen ganz einfach' }
  subtitle_en { 'Learn how to cook' }
  description_de { 'Kochkurs für Anfänger.' }
  description_en { 'Cooking Workshop for Beginners.' }
  category { Category.make }
  offered_on { DateTime.now + 5.days }
  fees { 500.0 }
  provider { User.make }
  main_image { 'example.jpg' }
  is_approved { true }
  minimum_workshop_registration_count { 1 }
  maximum_workshop_registration_count { 20 }
end

WorkshopSession.blueprint do
  title_de { 'Gemüse schneiden' }
  title_en { 'Cutting vegetables' }
  subtitle_de { 'wie man richtig schneidet' }
  subtitle_en { 'how to cut properly' }
  description_de { 'der richtige Umgang mit dem Gemüsemesser' }
  description_en { 'the proper use of a cuting knife' }
  starts_at { DateTime.now }
  ends_at { DateTime.now + 3.hours }
  level { Level.make }
  main_image { 'example.jpg' }
  tutor { User.make }
  workshop { Workshop.make }
  venue { Venue.make }
  minimum_participation_count { 1 }
  maximum_participation_count { 20 }
end
