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
