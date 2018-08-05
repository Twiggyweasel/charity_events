# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

5.times do
  User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, email: FFaker::Internet.email)
end

count = 0
5.times do
  count = count + 1
  Organization.create(name: FFaker::Education.school_name, user_id: count)
end

count = 0
5.times do
  count = count + 1
  OrganizationMember.create(organization_id: rand(1..5), user_id: count, role: 1)
end

count = 0
2.times do
  count = count + 1
  Event.create(name: "Test Event" + count.to_s, status: rand(0..1), start_date: DateTime.now, end_date: DateTime.now + 1.day, description: "Test Description", organization_id: rand(1..5))
end
