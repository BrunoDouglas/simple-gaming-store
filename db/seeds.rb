# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Platform.destroy_all
AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Loading Plaftorms
file = File.read('db/datasources/platforms.json')
count = 1
JSON.parse(file).map {|x| x['data']['platforms']}.each do |n|
  platform = Platform.create(:name => n[count.to_s]['name'])
  count += 1
  puts "Created: #{platform.name}"
end