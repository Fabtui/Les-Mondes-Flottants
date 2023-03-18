require "open-uri"

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

file = URI.open("app/assets/images/logo.png")
shop.logo.attach(io: file, filename: "logo.png", content_type: "image/png")
shop.save

puts "#{Shop.count} shop created"


# --------------------------------ARTIST------------------------------------

Artist.destroy_all
puts "Artist cleaned"

odahil = Artist.create(
  name: 'Odahil',
  speciality: 'Tatoueur',
  description: "Tatoueur au sein des Mondes Flottants; je suis illustrateur, et tatoueur. Spécialiste du néo-traditionnel, et de l’ornemental; en couleurs, ou en noir et nuances de gris. J'adore explorer de nouveaux designs, tout en rajoutant un aspect ornemental et symétrique. Place à vos envies !",
)
odahil_profile_pic = URI.open("app/assets/images/odahil/Odahil_profile.jpg")
odahil.profile_pic.attach(io: odahil_profile_pic, filename: "#{odahil.name}-profile.jpg", content_type: "image/jpg")
odahil_photo1 = URI.open("app/assets/images/odahil/krialid3.jpg")
odahil.photo1.attach(io: odahil_photo1, filename: "#{odahil.name}-photo1.jpg", content_type: "image/jpg")
odahil.save

puts "#{Artist.count} artist created"
