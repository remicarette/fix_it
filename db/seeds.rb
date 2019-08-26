# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
    brand: brand)
end

# DESTROY

puts "destroy all users"

User.destroy_all


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

# CREATE SKILL

puts "Create skills"

create_skill(daniel, 'Chaffoteaux')
create_skill(daniel, 'Saunier Duval')
create_skill(daniel, 'Atlantic')

puts "#{User.count} users created"
puts "#{Skill.count} skills created"


