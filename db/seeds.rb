require "open-uri"

Appointment.destroy_all
puts "Appointment cleaned"

# --------------------------------SHOP------------------------------------

Shop.destroy_all
puts "Shop cleaned"

shop = Shop.create(
  name: 'Les Mondes Flottants',
  address: '17 rue Blanqui, 42000 Saint-Etienne',
  phone: '0477123456',
  email: 'test@mail.com',
  url: 'http://localhost:3000/',
  facebook: '#',
  instagram: '#',
  twitter: '#',
  caption: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga accusamus alias dolore consequatur architecto cumque deserunt quis vel?",
  global_opening: 'Lundi au samedi, 9h-12h | 14h18h',
  monday_opening: 'Fermé',
  tuesday_opening: '9h-12h 14h18h',
  wednesday_opening: '9h-12h 14h18h',
  thursday_opening: '9h-12h 14h18h',
  friday_opening: '9h-12h 14h-18h',
  saturday_opening: '9h-12h 14h-18h',
  sunday_opening: 'Fermé',
)

file = URI.open("app/assets/images/logo.png")
shop.logo.attach(io: file, filename: "logo.png", content_type: "image/png")
shop.save

puts "#{Shop.count} shop created"



# --------------------------------USER------------------------------------

User.destroy_all
puts "User cleaned"

admintest = User.create(
  email: 'toto@mail.com',
  name: 'Toto',
  password: 'azerty',
  address: 'Loin',
  admin: true
)

sami = User.create(
  password: 'azerty',
  first_name: 'Sami',
  last_name: 'Dernouny',
  admin: true,
  artist: true,
  email: 'sami@lesmondesflottants.com',
  address: 'Rue Blanqui, 42000 Saint Etienne',
  name: 'Odahil',
  speciality: 'Tatoueur',
  description: "Tatoueur au sein des Mondes Flottants; je suis illustrateur, et tatoueur. Spécialiste du néo-traditionnel, et de l’ornemental; en couleurs, ou en noir et nuances de gris. J'adore explorer de nouveaux designs, tout en rajoutant un aspect ornemental et symétrique. Place à vos envies !",
  start_time: "9:00",
  end_time: "17:00",
)
odahil_profile_pic = URI.open("app/assets/images/odahil/Odahil_profile.jpg")
sami.profile_pic.attach(io: odahil_profile_pic, filename: "#{sami.name}-profile.jpg", content_type: "image/jpg")
odahil_photo1 = URI.open("app/assets/images/odahil/krialid3.jpg")
sami.photo1.attach(io: odahil_photo1, filename: "#{sami.name}-photo1.jpg", content_type: "image/jpg")
sami.save

puts "#{User.count} user created"

# --------------------------------TATTOO------------------------------------

Tattoo.destroy_all
puts "Tattoo cleaned"

koi = Tattoo.new(
  name: "Carpe",
  description: "Carpe Koï bleue",
  client: "Simone",
  user_id: sami.id,
  date: "2021-09-03T21:30",
)
koi.photo.attach(io: File.open('app/assets/images/tattoos/tattoo2.jpg'), filename: 'koi.jpg', content_type:'image/jpg')
koi.save

montgolfiere = Tattoo.new(
  name: "Montgolfiere",
  description: "Une mongole fière",
  client: "Jeannine",
  user_id: sami.id,
  date: "2021-09-03T21:30",
)
montgolfiere.photo.attach(io: File.open('app/assets/images/tattoos/tattoo3.jpg'), filename: 'puppet.jpg', content_type:'image/jpg')
montgolfiere.save

picsou = Tattoo.new(
  name: "Picsou",
  description: "Picsou ma gueule",
  client: "Jean Mourad",
  user_id: sami.id,
  date: "2021-09-03T21:30",
)
picsou.photo.attach(io: File.open('app/assets/images/tattoos/tattoo4.jpg'), filename: 'picsou.jpg', content_type:'image/jpg')
picsou.save

geo = Tattoo.new(
  name: "Geometric",
  description: "Un blason non?",
  client: "Jean Michel",
  user_id: sami.id,
  date: "2021-09-03T21:30",
)
geo.photo.attach(io: File.open('app/assets/images/tattoos/tattoo5.jpg'), filename: 'geo.jpg', content_type:'image/jpg')
geo.save

cat = Tattoo.new(
  name: "catopatra",
  description: "Chat égyptchien",
  client: "Jean Eude",
  user_id: sami.id,
  date: "2021-09-03T21:30",
)
cat.photo.attach(io: File.open('app/assets/images/tattoos/tattoo6.jpg'), filename: 'cat.jpg', content_type:'image/jpg')
cat.save

lion = Tattoo.new(
  name: "simba",
  description: "Un gros chat",
  client: "Jean Eude",
  user_id: sami.id,
  date: "2021-09-03T21:30",
)
lion.photo.attach(io: File.open('app/assets/images/tattoos/tattoo7.jpg'), filename: 'lion.jpg', content_type:'image/jpg')
lion.save

puts "#{Tattoo.count} shop created"


# --------------------------------FLASH------------------------------------

Flash.destroy_all
puts "Flash cleaned"

(1..11).each do |i|
  flash1 = Flash.new(
    name: "Flash #{i}",
    description: "#{i}",
    user_id: sami.id,
    price: 199,
    height: 20,
    width: 10,
    duration: "2h30",
    date: "2021-09-03T21:30",
  )
  flash1.photo.attach(io: File.open("app/assets/images/flashes/art#{i}.jpg"), filename: "flash#{i}.jpg", content_type:'image/jpg')
  flash1.save
end

puts "#{Flash.count} flashes created"
