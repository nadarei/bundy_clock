# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding users..."
puts ""

['John', 'Jason', 'Jennifer', 'Jordan'].each do |name|
  email = "#{name.downcase}@gmail.com"
  puts " * %-10s (%s)" % [name, email]

  User.create name: name, email: email
end

puts ""
puts "Done. Default users created."
puts "You may want to create your own users using `rake db:create_users`."
