# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Page.destroy_all
Item.destroy_all
Order.destroy_all
Game.destroy_all
Platform.destroy_all
AdminUser.destroy_all
Province.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Loading About Page
Page.create(name: 'about', content: '<p>Founded in 1996,
  Gesk Store is your must-go place for everything video-game related in Winnipeg.</p>
  <p>We are proudly made of gamers and we constantly promote LOL and DOTA championships to movement the video gaming scene in our city.</p>
  <p>Come have a coffee with us, make new friends and maybe win one of our championships.</p>')

# Loading Contat
Page.create(name: 'contact', content: '<p>Geske Store is located at 123 Main St, Winnipeg MB.</p>
  <p>You can contact us using our email: <a href="mailto:contact@geskestore.ca">contact@geskestore.ca</a></p>
  <p>Telephone: +1 (555) 555-5555 / +1 (555) 555-5544</p>
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2570.510718574748!2d-97.13668814963785!3d49.88921433542582!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x52ea7151d6226197%3A0x51d5281bd7cf792a!2sUnion+Station%2C+123+Main+St%2C+Winnipeg%2C+MB+R3C+4V9!5e0!3m2!1sen!2sca!4v1541709826974"
  width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>')

# Loading Provinces
file = File.read('db/datasources/provinces.json')
JSON.parse(file).each do |n|
  province = Province.create(name: n['province'], gst: n['gst'], hst: n['hst'], pst: n['pst'])
  province.errors.full_messages
  puts "Created: #{province.name} hst => #{province.hst}"
end

# Loading Plaftorms
file = File.read('db/datasources/platforms.json')
JSON.parse(file).each do |n|
  platform = Platform.create(name: n['name'])
  platform.errors.full_messages
  puts "Created: #{platform.name}"
end

# Loading Games
file = File.read('db/datasources/games_1.json')
JSON.parse(file).each do |n|
  game = Game.create(name: n['game_title'], image: n['image'], platform: n['platform'], description: n['description'], price: n['price'])
  game.errors.full_messages
end
