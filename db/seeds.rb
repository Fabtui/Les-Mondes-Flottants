require "open-uri"

# --------------------------------USER------------------------------------

User.destroy_all
puts "User cleaned"

admintest = User.create(
  email: 'toto@mail.com',
  nickname: 'Toto',
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
  nickname: 'Odahil',
  speciality: 'Tatoueur',
  description: "Tatoueur au sein des Mondes Flottants; je suis illustrateur, et tatoueur. Spécialiste du néo-traditionnel, et de l’ornemental; en couleurs, ou en noir et nuances de gris. J'adore explorer de nouveaux designs, tout en rajoutant un aspect ornemental et symétrique. Place à vos envies !",
  start_time: "9:00",
  end_time: "17:00",
)
odahil_profile_pic = URI.open("app/assets/images/odahil/Odahil_profile.jpg")
sami.profile_pic.attach(io: odahil_profile_pic, filename: "#{sami.nickname}-profile.jpg", content_type: "image/jpg")
odahil_photo1 = URI.open("app/assets/images/odahil/krialid3.jpg")
sami.photo1.attach(io: odahil_photo1, filename: "#{sami.nickname}-photo1.jpg", content_type: "image/jpg")
sami.save

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
