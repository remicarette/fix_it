SKILLS = ["Frisquet", "Viessmann", "Atlantic", "Weishaupt", "Vergne"]


def create_pro(first_name, last_name, phone, address, zip_code, city, photo, company)
  User.create!(
    email:        "#{first_name}@fix-it.com",
    password:     'azerty',
    first_name:   first_name,
    last_name:    last_name,
    phone:        phone,
    address:      address,
    zip_code:     zip_code,
    city:         city,
    user_type:    'pro',
    photo:        photo,
    company_name: company
  )
  SKILLS.each do |skill|
    create_skill(User.last, skill)
  end
  User.last
end

def create_client(first_name, last_name, phone, address, zip_code, city, photo)
  remi = User.create!(
    email:        "#{first_name}@fix-it.com",
    password:     'azerty',
    first_name:   first_name,
    last_name:    last_name,
    phone:        phone,
    address:      address,
    zip_code:     zip_code,
    city:         city,
    user_type:    'perso',
    photo:        photo,
    company_name: ''
  )
  User.last
end

def create_skill(user, brand)
  skill = Skill.create!(
    user:   user,
    brand:  brand
  )
  Skill.last
end

def create_equipement(user, brand, model, status)
  Equipement.create!(
    user:   user,
    brand:  brand,
    model:  model,
    status: status
  )
  Equipement.last
end

def create_booking(equipement, pro, error_code, description, begin_string, end_string)
  Booking.create!(
    equipement:   equipement,
    user:         pro,
    error_code:   error_code,
    description:  description,
    status:       0,
    begin:         (begin_string),
    end:          DateTime.parse(end_string)
  )
  Booking.last
end

# '2001/02/03 03:05'

def create_review(title, content, stars, booking)
  Review.create!(
    title:    title,
    content:  content,
    stars:    stars,
    booking:  booking
  )
  Review.last
end

def create_message(sender, receiver, content)
  Message.create!(
    sender:   sender,
    receiver: receiver,
    content:  content
  )
  Message.last
end


# DESTROY #####################################

puts "destroy all users"

Message.destroy_all
User.destroy_all



# CREATE CLIENTS ############################################

# def create_client(
#   first_name,
#   last_name,
#   phone,
#   address,
#   zip_code,
#   city,
#   photo
# )

puts "create client"

# CREATE 3 USERS

remi = create_client(
  'remi',
  'carette',
  '0680782606',
  '2 rue de condé',
  '59000',
  'La madeleine',
  'https://ca.slack-edge.com/T02NE0241-UL79224P2-7a94c0d24580-48'
)

User.create!(
  email:        "moritz@fix-it.com",
  password:     'qwertz',
  first_name:   "moritz",
  last_name:    "michalak",
  phone:        "0392302320",
  address:      "15 boulevard de la liberté",
  zip_code:     "59000",
  city:         "Lille",
  user_type:    'perso',
  photo:        'https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48',
  company_name: ''
)
moritz = User.last

renald = create_client(
  'renald',
  'HB',
  '0320000001',
  '3 boulevard de la Liberté',
  '59000',
  'Lille',
  'https://ca.slack-edge.com/T02NE0241-UL7AQBP5E-2d8af2da19e6-48'
)

puts "create pro"

# CREATE 8 PRO

# def create_pro(
#   first_name,
#   last_name,
#   phone,
#   address,
#   zip_code,
#   city,
#   photo,
#   company
# )

# create 6 pro on lille

daniel = create_pro(
  'daniel',
  'haddad',
  '0320642581',
  '8 place Charles de Gaulle',
  '59110',
  'Lille',
  'https://www.baincapital.com/sites/default/files/team/Dan-Haddad.jpg',
  'pro'
)

eric = create_pro(
  'eric',
  'Plombar',
  '0320000000',
  '27 rue des tours',
  '59800',
  'Lille',
  'https://pbs.twimg.com/profile_images/858515649898872833/2nEb4ERQ_400x400.jpg',
  'pro'
)

jacquie = create_pro(
  'jacquie',
  'cuivre',
  '0320000000',
  '2 rue de la grande chaussée',
  '59800',
  'Lille',
  'http://www.lenecrologue.com/upload/obituary_img/resized/200x250_888124.jpg',
  'pro'
)

michel = create_pro(
  'michel',
  'acier',
  '0320000000',
  '10 rue de la grande chaussée',
  '59800',
  'Lille',
  'https://pbs.twimg.com/profile_images/988193701062160386/zl805vRv_400x400.jpg',
  'pro'
)

rodolphe = create_pro(
  'rodolphe',
  'gentil',
  '0320000000',
  '3 rue du Cure Saint-Etienne',
  '59800',
  'Lille',
  'https://s3-media4.fl.yelpcdn.com/bphoto/t8u_XdK6Wfqye3Qkn5-IVA/ls.jpg',
  'pro'
)

joseph = create_pro(
  'joseph',
  'messie',
  '0320000000',
  "2 rue de l'église",
  '59160',
  'Lille',
  'https://uvmmedicineblog.files.wordpress.com/2014/04/haddad_daniel.jpg',
  'pro'
)

# create 2 pro on Roubaix & dispo

momo = create_pro(
  'momo',
  'epeule',
  '0320000000',
  "3 rue de l'epeule",
  '59100',
  'Roubaix',
  'https://pbs.twimg.com/profile_images/638204126589906944/eMvaLiON_400x400.jpg',
  'pro'
)

abdel = create_pro(
  'abdel',
  'alma',
  '0320000000',
  "30 rue de l'alma",
  '59100',
  'Roubaix',
  'https://static.wixstatic.com/media/bb0f2f_249e3c968ae04148bfeec13e31b58262~mv2_d_1500_1500_s_2.jpg/v1/fill/w_200,h_200,al_c,q_80,usm_0.66_1.00_0.01/bb0f2f_249e3c968ae04148bfeec13e31b58262~mv2_d_1500_1500_s_2.jpg',
  'pro'
)


# create 2 pro on Lille mais non dispo

jesus = create_pro(
  'jesus',
  'marie',
  '0320000000',
  '4 rue du Cure Saint-Etienne',
  '59800',
  'Lille',
  'http://www.adventistemagazine.com/wp-content/uploads/2018/10/jesus-christ9.jpg',
  'pro'
)

chirac = create_pro(
  'jacques',
  'chirac',
  '0320000000',
  "3 rue de l'église",
  '59800',
  'Lille',
  'https://voi.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fvoi.2F2018.2F12.2F21.2Ffdc42be7-8b69-4820-8dbf-53ace4f3ea7f.2Ejpeg/2048x1152/quality/80/jacques-chirac-son-combat-contre-la-maladie-raconte-par-son-petit-fils-martin-rey-chirac.jpeg',
  'pro'
)

# create equipements for remi

puts "create Equipement for remi"
# def create_equipement(user, brand, model, status)

mira = create_equipement(remi, 'Chaffoteaux', 'Mira C Green', 'panne')
thema_plus = create_equipement(remi, 'Saunier Duval', 'ThemaPlus Condens', 'panne')
thema = create_equipement(moritz, 'Saunier Duval', 'ThemaPlus Condens', 'panne')

puts "create booking for abdel to be full tomorrow"
# def create_booking(equipement, pro, error_code, description, begin_string, end_string)


# booking pour chirac dispo aujourdhui

create_booking(
  thema,
  chirac,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)




# booking pour jesus dispo aujourdhui 20h

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 15:00',
  '2019/08/30 16:00'
)

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 16:00',
  '2019/08/30 17:00'
)

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 15:00',
  '2019/08/30 16:00'
)

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 16:00',
  '2019/08/30 17:00'
)

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 17:00',
  '2019/08/30 18:00'
)

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 18:00',
  '2019/08/30 19:00'
)

create_booking(
  thema,
  jesus,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 19:00',
  '2019/08/30 20:00'
)


# rodolphe gentil

# michel acier

# jacques cuivre

# eric plombar



create_booking(
  thema,
  eric,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/29 18:00',
  '2019/08/29 19:00'
)

create_booking(
  thema,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/09/01 08:00',
  '2019/08/30 09:00'
)

create_booking(
  thema,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/09/01 08:00',
  '2019/08/30 09:00'
)


create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)

create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 09:00',
  '2019/08/30 10:00'
)

create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 10:00',
  '2019/08/30 11:00'
)

create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 11:00',
  '2019/08/30 12:00'
)

create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 13:00',
  '2019/08/30 14:00'
)

create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 14:00',
  '2019/08/30 15:00'
)

create_booking(
  mira,
  abdel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 15:00',
  '2019/08/30 16:00'
)

puts "create booking for chirac to be full tomorrow"
# def create_booking(equipement, pro, error_code, description, begin_string)


# create bookings for tomorrow

# daniel dispo tout le temps
# eric dispo à 9h00

create_booking(
  mira,
  eric,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)

create_booking(
  mira,
  eric,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/29 18:00',
  '2019/08/29 19:00'
)

# jacquie dispo à 10h00

create_booking(
  mira,
  jacquie,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)

create_booking(
  mira,
  jacquie,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 09:00',
  '2019/08/30 10:00'
)

# michel dispo à 11h00

create_booking(
  mira,
  michel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)

create_booking(
  mira,
  michel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 09:00',
  '2019/08/30 10:00'
)

create_booking(
  mira,
  michel,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 10:00',
  '2019/08/30 11:00'
)

# rodolphe dispo à 12h00

create_booking(
  mira,
  rodolphe,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)

create_booking(
  mira,
  rodolphe,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 09:00',
  '2019/08/30 10:00'
)

create_booking(
  mira,
  rodolphe,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 10:00',
  '2019/08/30 11:00'
)

create_booking(
  mira,
  rodolphe,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 11:00',
  '2019/08/30 12:00'
)

# joseph dispo à 14h00

create_booking(
  mira,
  joseph,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 08:00',
  '2019/08/30 09:00'
)

create_booking(
  mira,
  joseph,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 09:00',
  '2019/08/30 10:00'
)

create_booking(
  mira,
  joseph,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 10:00',
  '2019/08/30 11:00'
)

create_booking(
  mira,
  joseph,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 11:00',
  '2019/08/30 12:00'
)

create_booking(
  mira,
  joseph,
  'error 404',
  'elle tombe toujours en panne',
  '2019/08/30 13:00',
  '2019/08/30 14:00'
)

puts "Create messages"

create_message(daniel, remi, "Je quitte mon rendez et arrive dans 10 min")
create_message(remi, daniel, "C'est noté, je préviens ma femme")

puts "#{User.count} users created"
puts "#{Skill.count} skills created"
puts "#{Equipement.count} equipements created"
puts "#{Booking.count} bookings created"
puts "#{Review.count} reviews created"
puts "#{Message.count} messages created"


