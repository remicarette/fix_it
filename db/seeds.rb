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


def create_full_booking_today(equipement, pro)
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 08:00','2019/09/02 09:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 09:00','2019/09/02 10:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 10:00','2019/09/02 11:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 11:00','2019/09/02 12:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 12:00','2019/09/02 12:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 13:00','2019/09/02 14:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 14:00','2019/09/02 15:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 15:00','2019/09/02 16:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 16:00','2019/09/02 17:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 17:00','2019/09/02 18:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 18:00','2019/09/02 19:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 19:00','2019/09/02 20:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/02 20:00','2019/09/02 21:00')
end

def create_full_booking_before_with_reviews(equipement, pro)
  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 08:00','2019/08/28 09:00')
  create_review("Super plombier !", "Je vous le recommande", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 09:00','2019/08/28 10:00')
  create_review("Pro", "Le boulot est fait ! je vous le recommande", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 10:00','2019/08/28 11:00')
  create_review("Travail impeccable", "Bravo !", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 11:00','2019/08/28 12:00')
  create_review("Good job", "Blow job", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 12:00','2019/08/28 12:00')
  create_review("A fuire !", "Plus jamais", rand(1..3), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 13:00','2019/08/28 14:00')
  create_review("Top !", "Rien à dire", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 14:00','2019/08/28 15:00')
  create_review("Super !!!! Merci !", "Mon nouveau plombier de famille", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 15:00','2019/08/28 16:00')
  create_review("Youpi ! ", "Merci !", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 16:00','2019/08/28 17:00')
  create_review("Super plombier !", "Je vous le recommande", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 17:00','2019/08/28 18:00')
  create_review("Super plombier !", "Je vous le recommande", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 18:00','2019/08/28 19:00')
  create_review("Super plombier !", "Je vous le recommande", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 19:00','2019/08/28 20:00')
  create_review("Super plombier !", "Je vous le recommande", rand(3..5), b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 20:00','2019/08/28 21:00')
end

def create_full_booking_before_with_reviews_and_notation(equipement, pro, stars)
  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 08:00','2019/08/28 09:00')
  create_review("Super plombier !", "Je vous le recommande", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 09:00','2019/08/28 10:00')
  create_review("Pro", "Le boulot est fait ! je vous le recommande", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 10:00','2019/08/28 11:00')
  create_review("Travail impeccable", "Bravo !", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 11:00','2019/08/28 12:00')
  create_review("Good job", "Blow job", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 12:00','2019/08/28 12:00')
  create_review("A fuire !", "Plus jamais", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 13:00','2019/08/28 14:00')
  create_review("Top !", "Rien à dire", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 14:00','2019/08/28 15:00')
  create_review("Super !!!! Merci !", "Mon nouveau plombier de famille", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 15:00','2019/08/28 16:00')
  create_review("Youpi ! ", "Merci !", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 16:00','2019/08/28 17:00')
  create_review("Super plombier !", "Je vous le recommande", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 17:00','2019/08/28 18:00')
  create_review("Super plombier !", "Je vous le recommande", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 18:00','2019/08/28 19:00')
  create_review("Super plombier !", "Je vous le recommande", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 19:00','2019/08/28 20:00')
  create_review("Super plombier !", "Je vous le recommande", stars, b)

  b = create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/08/28 20:00','2019/08/28 21:00')
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

users = [ ]

users << remi = create_client('remi','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL79224P2-7a94c0d24580-48')
# users << moritz = create_client('moritz','michalak','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48')
# users << fx = create_client('fx','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-U04QWL5QD-b0caace14645-48')
# users << marmouz = create_client('marmouz','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL96Z3JUX-62eb1e8abb98-72')
# users << nico = create_client('nounours','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL7JFQ0R3-3696ceb54c45-48')
# users << pab = create_client('Pierre Antoine','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL0U0N3NV-f7cb9889f0c7-48')

# users << simon = create_client('simon','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL7B9TJRW-8ac16206f4ef-48')
# users << alex = create_client('Alexandre','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-U8PB5EDA7-77484b5916bb-48')
# users << richetin = create_client('richetin','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL12X27UZ-d1d5d66ec638-48')
# users << jean = create_client('Jean','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UKVSSU5NE-c9a10bc9c700-48')
# users << lea = create_client('Léa','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-U6317MLEN-589a70b497ad-48')
# users << pauline = create_client('pauline','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UHPSUU48H-1133cb05d3eb-48')



# users << zuza = create_client('zuza','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UBGQ0BJN5-3050831c17e3-48')
# users << saunier = create_client('Sebastien','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-U02NE0247-e4421ea8648d-48')
# users << james = create_client('james','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UKPL7B534-a850a2c242f2-48')
# users << edouard = create_client('edouard','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UF9B65UP8-7d1fb4b6b2ab-48')
# users << martin = create_client('martin','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-U4A8MS264-73769aabb729-48')
# users << carl = create_client('Carl','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UHRGG9RRS-836bce4715df-48')

# users << lisa = create_client('Lisa','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UD41T1DQC-c8ddc1161b50-48')

# users << nico = create_client('nicolas','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UA2RBL0E5-074dba9f9557-48')
# users << tristan = create_client('tristan','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UHSBPN26T-30dd301382cc-48')






User.create!(
  email:        "moritz@fix-it.com",
  password:     'qwertz',
  first_name:   "moritz",
  last_name:    "michalak",
  phone:        "0392820320",
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
thema = create_equipement(remi, 'Saunier Duval', 'ThemaPlus Condens', 'panne')

# def create_booking(equipement, pro, error_code, description, begin_string, end_string)

create_full_booking_before_with_reviews_and_notation(thema, jesus, 4)
create_full_booking_before_with_reviews_and_notation(thema, jesus, 3)
create_full_booking_before_with_reviews_and_notation(thema, jesus, 2)
create_full_booking_before_with_reviews_and_notation(thema, jesus, 4)


create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 13:00','2019/08/30 14:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 14:00','2019/08/30 15:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 15:00','2019/08/30 16:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 16:00','2019/08/30 17:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 17:00','2019/08/30 18:00')

create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 08:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 09:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 10:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 11:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 12:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 13:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 14:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 15:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 16:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 18:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 19:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 20:00','2019/08/31 08:00')

create_full_booking_before_with_reviews_and_notation(thema, chirac, 4)
create_full_booking_before_with_reviews_and_notation(thema, chirac, 4)
create_full_booking_before_with_reviews_and_notation(thema, chirac, 4)


create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/31 13:00','2019/08/31 14:00')
create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/31 14:00','2019/08/31 15:00')
create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/31 15:00','2019/08/31 16:00')
create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/31 16:00','2019/08/31 17:00')
create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/31 17:00','2019/08/31 18:00')

create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 08:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 09:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 11:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 12:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 13:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 15:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 16:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 18:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 19:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 20:00','2019/08/31 08:00')

# rodolphe gentil

create_full_booking_today(thema,rodolphe)
create_full_booking_before_with_reviews(thema, rodolphe)
create_full_booking_before_with_reviews(thema, rodolphe)


# michel acier

create_full_booking_today(thema,michel)
bm1 = create_booking(thema,michel,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
create_review("Au top !", "Efficace et rapide ! Merci", 4, bm1)
create_full_booking_before_with_reviews(thema, michel)
create_full_booking_before_with_reviews(thema, michel)


# jacques cuivre

create_full_booking_today(thema,jacquie)
bj1 = create_booking(thema,jacquie,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
bj2 = create_booking(thema,jacquie,'error 404','elle tombe toujours en panne','2019/08/31 08:00','2019/08/31 09:00')
create_review("Super plombier !", "Je vous le recommande", 3, bj1)
create_review("Super !", "Bon rapport qualité / prix", 5, bj2)
create_full_booking_before_with_reviews(thema, jacquie)
create_full_booking_before_with_reviews(thema, jacquie)


# eric plombar

create_full_booking_today(thema ,eric)
be1 = create_booking(thema,eric,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
be2 = create_booking(thema,eric,'error 404','elle tombe toujours en panne','2019/08/31 08:00','2019/08/31 09:00')
be3 = create_booking(thema,eric,'error 404','elle tombe toujours en panne','2019/08/31 09:00','2019/08/31 09:00')
create_review("Super plombier !", "Je vous le recommande", 4, be1)
create_review("Super plombier !", "Je vous le recommande", 4, be2)
create_review("Peu mieux faire", "Retard, le technicien est énervé mais c'est réparé", 2, be3)
create_full_booking_before_with_reviews(thema, eric)
create_full_booking_before_with_reviews(thema, eric)
create_full_booking_before_with_reviews(thema, eric)

puts "Create messages"

create_message(daniel, remi, "Je quitte mon rendez et arrive dans 10 min")
create_message(remi, daniel, "C'est noté, je préviens ma femme")

puts "#{User.count} users created"
puts "#{Skill.count} skills created"
puts "#{Equipement.count} equipements created"
puts "#{Booking.count} bookings created"
puts "#{Review.count} reviews created"
puts "#{Message.count} messages created"


