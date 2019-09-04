SKILLS = [ "Saunier Duval", "Frisquet", "Viessmann", "Chaffoteaux", "Atlantic", "Weishaupt", "Vergne"]


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
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 08:00','2019/09/03 09:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 09:00','2019/09/03 10:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 10:00','2019/09/03 11:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 11:00','2019/09/03 12:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 12:00','2019/09/03 12:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 13:00','2019/09/03 14:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 14:00','2019/09/03 15:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 15:00','2019/09/03 16:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 16:00','2019/09/03 17:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 17:00','2019/09/03 18:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 18:00','2019/09/03 19:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 19:00','2019/09/03 20:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/03 20:00','2019/09/02 21:00')
end



def create_full_booking_before_with_reviews(equipement, pro)
  equipement_sample = Equipement.all.sample
  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 08:00','2019/08/28 09:00')
  create_review("Après Super Mario, Super #{b.user.first_name} ! 😂", "Je vous recommande #{b.user.first_name}.", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 09:00','2019/08/29 10:00')
  create_review("Un travail de pro 🛠⚙️🙏", "Le boulot est fait ! N'hésitez vraiment pas", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 10:00','2019/08/27 11:00')
  create_review("Travail impeccable 🛠⚙️🙏 ", "Un grand merci à #{b.user.first_name} d'avoir répondu rapidemment!", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 11:00','2019/08/30 12:00')
  create_review("Good job 💪", "J'avais une résa pour des clients Airbn'b, ouf! sauvé!", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 12:00','2019/08/25 12:00')
  create_review("A fuir vraiment 😱!", "Plus jamais, #{b.user.first_name} se dit dispo mais propose de revenir dans 3 jours parce que je n'aurai pas indiqué la bonne chaudière..comme si!!!", rand(1..3), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 13:00','2019/09/02 14:00')
  create_review("Top 👏!", "Le tchat permet de gagner du temps et de suivre en temps réel 😀", rand(2..4), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 14:00','2019/08/21 15:00')
  create_review("Super 👏🙏! Merci #{b.user.first_name}!", "#{b.user.first_name} est the plumber of family 👏", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 15:00','2019/09/03 16:00')
  create_review("Youpi! 🙏😃", "Merci à #{b.user.first_name} d'être intervenu, je peux enfin prendre une douche chaude !", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 16:00','2019/08/02 17:00')
  create_review("Super #{b.user.first_name} 💪!", "Très à l'écoute et efficace et tout ça grace à Fix it", rand(2..4), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 17:00','2019/08/01 18:00')
  create_review("Une perle! 💎", "#{b.user.first_name} a sauvé mon week-end..et mon couple", rand(1..3), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 18:00','2019/09/03 19:00')
  create_review("Merci Fix it! 👏🙏", " #{b.user.first_name} est sympa et pro", rand(1..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 19:00','2019/08/28 20:00')
  create_review("Super #{b.user.first_name} 💎!", "J'adoOore le tchat 👨‍💻", rand(3..5), b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 20:00','2019/08/28 21:00')
end

def create_full_booking_before_with_reviews_and_notation(equipement, pro, stars)
  equipement_sample = Equipement.all.sample

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 08:00','2019/08/28 09:00')
  create_review("Une personne en Or 🙏😃 !", "Merci #{b.user.first_name}, Merci Fix it", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 09:00','2019/08/28 10:00')
  create_review("Pro 👍", "Le boulot est fait ! je vous recommande #{b.user.first_name} chaudement", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 10:00','2019/08/28 11:00')
  create_review("Travail impeccable bien 🙏😃", "Bravo à #{b.user.first_name} d'avoir assuré !", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 11:00','2019/08/28 12:00')
  create_review("Good job 💪👍🙏", " bravo à #{b.user.first_name} et merci Fix it!", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 12:00','2019/08/28 12:00')
  create_review("A fuir 😱!", "Plus jamais, non mais!!! l'eau était trop chaude.🥵", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 13:00','2019/08/28 14:00')
  create_review("Top 💪!", "J'étais perdu, sans connaitre de plombier, Vive Fix it", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 14:00','2019/08/28 15:00')
  create_review("Super !!!! Merci 🙏 !", "La famille dit merci!", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 15:00','2019/08/28 16:00')
  create_review("Youpi 👏! ", "Un vrai Grand Merci à #{b.user.first_name}!", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 16:00','2019/08/28 17:00')
  create_review("Bravo et merci! 💪👍🙏", "J'étais fan de Mario, maintenant je suis fan de #{b.user.first_name}", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 17:00','2019/08/28 18:00')
  create_review("Un pro vraiment pro 💪👍🙏!", "Enfin un pro qui sait ce qu'il fait", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 18:00','2019/08/28 19:00')
  create_review("Super Mario? Non, Super #{b.user.first_name} !", "#{b.user.first_name} a réparé en deux-deux ma chaudière 🙏😃.", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 19:00','2019/08/28 20:00')
  create_review("De l'eau chaude enfin 👍😃 !", "Merci qui? merci #{b.user.first_name}", stars, b)

  b = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 20:00','2019/08/28 21:00')
end




# '2001/02/03 03:05'

def create_review(title, content, stars, booking)
  Review.create!(
    title:    title,
    content:  content,
    stars:    stars,
    booking:  booking,
  )
  review = Review.last
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
#  first_name,
#  last_name,
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
#users << moritz = create_client('moritz','michalak','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48')
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

nicolas = create_client(
  'nicolas',
  'schmelzer',
  '0320458754',
  '32 allée Nounours',
  '59800',
  'Lille',
  'https://ca.slack-edge.com/T02NE0241-UL7JFQ0R3-3696ceb54c45-72'
  )
faustine = create_client(
  'faustine',
  'lafaust',
  '032045"754',
  '5 boulevard des pommes',
  '59000',
  'Lille',
  'https://ca.slack-edge.com/T02NE0241-UL79LBN2U-c39e691544c6-72'
  )
marine = create_client(
  'marine',
  'hacki',
  '0320658754',
  '76 rue Turing',
  '59800',
  'Lille',
  'https://ca.slack-edge.com/T02NE0241-UL96Z3JUX-62eb1e8abb98-72'
  )
jean = create_client(
  'jean',
  'Kamarat',
  '0320458754',
  '59 rue Lebanon',
  '59000',
  'Lille',
  'https://ca.slack-edge.com/T02NE0241-UKVSSU5NE-c9a10bc9c700-72'
  )
linus = create_client(
  'linus',
  'Torvalds',
  '0320458754',
  '10 avenue de Helsinski',
  '59000',
  'Lille',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg/240px-LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg'
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
  'Paul',
  'Van Haver',
  '0320642581',
  '8 place Charles de Gaulle',
  '59110',
  'Lille',
  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
  'pro'
)

eric = create_pro(
  'Nordin',
  'Hateur',
  '0320000000',
  '27 rue des tours',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80',
  'pro'
)

jacquie = create_pro(
  'Jacquie',
  'Mimexa',
  '0320000000',
  '2 rue de la grande chaussée',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=656&q=80',
  'pro'
)

michel = create_pro(
  'Michèle',
  'Tomthé',
  '0320000000',
  '10 rue de la grande chaussée',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1565794955623-d5baeab355a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
  'pro'
)

rodolphe = create_pro(
  'Rodolphe',
  'Ramabah',
  '0320000000',
  '3 rue du Cure Saint-Etienne',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
  'pro'
)

joseph = create_pro(
  'Joseph',
  'Giodo',
  '0320000000',
  "2 rue de l'église",
  '59160',
  'Lille',
  'https://images.unsplash.com/flagged/photo-1561530822-923d268fa0a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'pro'
)

# create 2 pro on Roubaix & dispo

momo = create_pro(
  'Momo',
  'Serif',
  '0320000000',
  "3 rue de l'epeule",
  '59100',
  'Roubaix',
  'https://images.unsplash.com/photo-1552072805-2a9039d00e57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'pro'
)

abdel = create_pro(
  'Abdel',
  'Enclemt',
  '0320000000',
  "30 rue de l'alma",
  '59100',
  'Roubaix',
  'https://images.unsplash.com/photo-1543947431-982154385ed4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80',
  'pro'
)


# create 2 pro on Lille mais non dispo

jesus = create_pro(
  'Marie-Hélène',
  'Linepo',
  '0320000000',
  '4 rue du Cure Saint-Etienne',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1553271602-c8a96abf13e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'pro'
)

chirac = create_pro(
  'Estelle',
  'Andraxele',
  '0320000000',
  "3 rue de l'église",
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1558499932-9609acb6f443?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'pro'
)

# create equipements for remi

puts "create Equipement for remi"
# def create_equipement(user, brand, model, status)
#model : Frisquet", "Viessmann", "Chaffoteaux", "Atlantic", "Weishaupt", "Vergne", "Saunier Duval"
chauffa = create_equipement(remi, 'Chaffoteaux', 'Chauftout', 'panne')
thema_plus = create_equipement(remi, 'Weishaupt', 'thema plus', 'panne')
#equipement for moritz
chauffo = create_equipement(moritz, 'Chaffoteaux', 'Chauffo', 'panne')
horizona = create_equipement(moritz, 'Atlantic', 'Horizona', 'panne')
#equipement for renald
mira = create_equipement(renald, 'Saunier Duval', 'Mira', 'panne')
mark = create_equipement(renald, 'Vergne', 'Mark III', 'panne')
#equipement for nicolas
thema = create_equipement(nicolas, 'Frisquet', 'thema 2', 'panne')
mark = create_equipement(nicolas, 'Vergne', 'Mark III', 'panne')
#equipement for faustine
thema_plus = create_equipement(faustine, 'Weishaupt', 'thema plus', 'panne')
thema = create_equipement(faustine, 'Frisquet', 'thema 2', 'panne')
#equipement for marine
koln = create_equipement(marine, 'Weishaupt', 'Koln', 'panne')
mark = create_equipement(marine, 'Vergne', 'Mark III', 'panne')
#equipement for jean
mira = create_equipement(jean, 'Saunier Duval', 'Mira', 'panne')
wasser = create_equipement(jean, 'Viessmann', 'wasser', 'panne')
#equipement for linus
wasser = create_equipement(linus, 'Viessmann', 'wasser', 'panne')
thema = create_equipement(linus, 'Frisquet', 'thema 2', 'panne')


# def create_booking(equipement, pro, error_code, description, begin_string, end_string)

create_full_booking_before_with_reviews_and_notation(chauffa, jesus, 4)
create_full_booking_before_with_reviews_and_notation(wasser, jesus, 3)
create_full_booking_before_with_reviews_and_notation(horizona, jesus, 2)
create_full_booking_before_with_reviews_and_notation(thema, jesus, 4)
create_full_booking_before_with_reviews_and_notation(thema_plus, jesus, 3)



create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 13:00','2019/08/30 14:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 14:00','2019/08/30 15:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 15:00','2019/08/30 16:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 16:00','2019/08/30 17:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/30 17:00','2019/08/30 18:00')

create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 08:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 09:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/08/31 10:00','2019/08/31 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 11:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 12:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 13:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 14:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 15:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 16:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 18:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 19:00','2019/09/02 08:00')
create_booking(thema,jesus,'error 404','elle tombe toujours en panne','2019/09/02 20:00','2019/09/02 08:00')

create_full_booking_before_with_reviews_and_notation(koln, chirac, 4)
create_full_booking_before_with_reviews_and_notation(thema, chirac, 4)
create_full_booking_before_with_reviews_and_notation(mira, chirac, 4)


# create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/30 13:00','2019/08/31 14:00')
# create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/30 14:00','2019/08/31 15:00')
create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/30 15:00','2019/08/31 16:00')
create_booking(mira,chirac,'error 404','elle tombe toujours en panne','2019/08/30 16:00','2019/08/31 17:00')
# create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/30 17:00','2019/08/31 18:00')
# create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/08/30 18:00','2019/08/31 18:00')

create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/09/02 07:00','2019/09/02 08:00')
create_booking(mira,chirac,'error 404','elle tombe toujours en panne','2019/09/02 08:00','2019/09/02 08:00')
create_booking(koln,chirac,'error 404','elle tombe toujours en panne','2019/09/02 09:00','2019/09/02 08:00')
create_booking(wasser,chirac,'error 404','elle tombe toujours en panne','2019/09/02 11:00','2019/09/02 08:00')
create_booking(mark,chirac,'error 404','elle tombe toujours en panne','2019/09/02 12:00','2019/09/02 08:00')
create_booking(thema,chirac,'error 404','elle tombe toujours en panne','2019/09/02 13:00','2019/09/02 08:00')
create_booking(chauffa,chirac,'error 404','elle tombe toujours en panne','2019/09/02 15:00','2019/09/02 08:00')
create_booking(horizona,chirac,'error 404','elle tombe toujours en panne','2019/09/02 16:00','2019/09/02 08:00')
create_booking(wasser,chirac,'error 404','elle tombe toujours en panne','2019/09/02 18:00','2019/09/02 08:00')
create_booking(mark,chirac,'error 404','elle tombe toujours en panne','2019/09/02 19:00','2019/09/02 08:00')
create_booking(chauffo,chirac,'error 404','elle tombe toujours en panne','2019/09/02 20:00','2019/09/02 08:00')


# rodolphe gentil

create_full_booking_today(thema,rodolphe)
create_full_booking_before_with_reviews(koln, rodolphe)
create_full_booking_before_with_reviews(horizona, rodolphe)


# michel acier

create_full_booking_today(thema,michel)
bm1 = create_booking(thema,michel,'error 404','elle tombe toujours en panne','2019/09/02 07:00','2019/09/02 08:00')
create_review("Au top !", "Efficace et rapide ! Merci", 4, bm1)
create_full_booking_before_with_reviews(horizona, michel)
create_full_booking_before_with_reviews(thema, michel)


# jacques cuivre

create_full_booking_today(thema,jacquie)
bj1 = create_booking(thema,jacquie,'error 404','elle tombe toujours en panne','2019/09/02 07:00','2019/09/02 08:00')
bj2 = create_booking(thema,jacquie,'error 404','elle tombe toujours en panne','2019/09/02 08:00','2019/09/02 09:00')
create_review("Super plombier !", "Je vous le recommande", 3, bj1)
create_review("Super !", "Bon rapport qualité / prix", 5, bj2)
create_full_booking_before_with_reviews(koln, jacquie)
create_full_booking_before_with_reviews(mira, jacquie)


# eric plombar

create_full_booking_today(thema ,eric)
be1 = create_booking(thema,eric,'error 404','elle tombe toujours en panne','2019/09/02 07:00','2019/09/02 08:00')
be2 = create_booking(mira,eric,'error 404','elle tombe toujours en panne','2019/09/02 08:00','2019/09/02 09:00')
be3 = create_booking(thema,eric,'error 404','elle tombe toujours en panne','2019/09/02 09:00','2019/09/02 09:00')
create_review("Super plombier 🙏😃 !", "Je vous le recommande", 4, be1)
create_review("Excellent !", "Vive fix it ", 4, be2)
create_review("Peu mieux faire", "Retard, le technicien est énervé mais c'est réparé", 2, be3)
create_full_booking_before_with_reviews(thema, eric)
create_full_booking_before_with_reviews(mira, eric)
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


