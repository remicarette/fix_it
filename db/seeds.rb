


def create_user(password, first_name, last_name, phone, address, zip_code, city, user_type)
  remi = User.create!(
    password: password,
    first_name: first_name,
    last_name: last_name,
    phone: phone,
    address: address,
    zip_code: zip_code,
    city: city,
    user_type: user_type,
    email: "#{first_name}@fix-it.com"
  )
  User.last
end

def create_skill(user, brand)
  skill = Skill.create!(
    user: user,
    brand: brand
  )
  Skill.last
end

def create_equipement(user, brand, model, status)
  Equipement.create!(
    user: user,
    brand: brand,
    model: model,
    status: status
  )
  Equipement.last
end

def create_booking(equipement, pro, error_code, description, status, start)
  Booking.create!(
    equipement: equipement,
    user: pro,
    error_code: error_code,
    description: description,
    status: status,
    begin: start
  )
  Booking.last
end

def create_review(title, content, stars, booking)
  Review.create!(
    title: title,
    content: content,
    stars: stars,
    booking: booking
  )
  Review.last
end

# DESTROY #####################################

puts "destroy all users"

User.destroy_all


# CREATE USER ############################################

puts "create user"

# def create_user(password, first_name, last_name, phone, address, zip_code, city, user_type)

remi = create_user(
  'azerty',
  'remi',
  'carette',
  '0680782606',
  '2 rue de condé',
  '59000',
  'La madeleine',
  'perso')

daniel = create_user(
  'azerty',
  'daniel',
  'haddad',
  '0320642581',
  '3 les érables',
  '59152',
  'Gruson',
  'pro')

# CREATE SKILL ###########################################
# def create_skill(user, brand)

puts "Create skills"

create_skill(daniel, 'Chaffoteaux')
create_skill(daniel, 'Saunier Duval')
create_skill(daniel, 'Atlantic')


# CREATE EQUIPEMENTS ######################################

puts "create Equipement"
# def create_equipement(user, brand, model, status)

mira = create_equipement(remi, 'Chaffoteaux', 'Mira C Green', 'panne')
thema_plus = create_equipement(remi, 'Saunier Duval', 'ThemaPlus Condens', 'panne')


# CREATE BOOKINGS ######################################

puts "create bookings"
# def create_booking(equipement, pro, error_code, description, status, start)

create_booking(mira, daniel, "108", "Ma chaudière ne démarre plus", "en attente", Date.today)

# CREATE REVIEWS ######################################

puts "Create review"

# def create_review(title, content, stars, booking)

create_review("Titre de la review", "Contenu de la review", 5, Booking.last)

puts "#{User.count} users created"
puts "#{Skill.count} skills created"
puts "#{Equipement.count} equipements created"
puts "#{Booking.count} bookings created"
puts "#{Review.count} reviews created"


