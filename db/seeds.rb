# --------------------------------USER------------------------------------

User.destroy_all
puts "User cleaned"

user = User.create(
  email: 'toto@mail.com',
  password: 'azerty',
  address: 'Loin',
  admin: true
)

puts "#{User.count} user created"

# --------------------------------SHOP------------------------------------

Shop.destroy_all
puts "Shop cleaned"

shop = Shop.create(
  name: 'Les Mondes Flottants',
  address: '17 rue Blanqui, 42000 Saint-Etienne',
  phone: '0477123456',
  email: 'test@mail.com',
  facebook: '#',
  instagram: '#',
  twitter: '#',
  global_opening: 'Lundi au samedi, 9h-12h | 14h18h',
  monday_opening: 'Fermé',
  tuesday_opening: '9h-12h 14h18h',
  wednesday_opening: '9h-12h 14h18h',
  thursday_opening: '9h-12h 14h18h',
  friday_opening: '9h-12h 14h18h',
  saturday_opening: '9h-12h 14h18h',
  sunday_opening: 'Fermé',
)

puts "#{Shop.count} shop created"

# --------------------------------ARTIST------------------------------------

Artist.destroy_all
puts "Artist cleaned"

artist1 = Artist.create(
  name: 'Odahil',
  description: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laudantium voluptatem eum officiis perspiciatis quae vel. Officia eveniet corrupti aliquid libero, expedita reprehenderit at? Qui alias architecto fuga voluptatibus suscipit magnam!',
)

puts "#{Artist.count} artist created"
