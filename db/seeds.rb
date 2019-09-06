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
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 08:00','2019/09/06 09:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 09:00','2019/09/06 10:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 10:00','2019/09/06 11:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 11:00','2019/09/06 12:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 12:00','2019/09/06 12:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 13:00','2019/09/06 14:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 14:00','2019/09/06 15:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 15:00','2019/09/06 16:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 16:00','2019/09/06 17:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 17:00','2019/09/06 18:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 18:00','2019/09/06 19:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 19:00','2019/09/06 20:00')
  create_booking(equipement,pro,'error 404','elle tombe toujours en panne','2019/09/06 20:00','2019/09/06 21:00')
end



def create_full_booking_before_with_reviews(equipement, pro)
  equipement_sample = Equipement.all.sample
  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 08:00','2019/08/28 09:00')
  create_review("Après Super Mario, Super #{bk.user.first_name}! 😂, vraiment super cool l'app", "Je vous recommande #{bk.user.first_name}. Il est très efficace et sympa 🙏, la famille peut enfin prendre une douche!!", 4, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 09:00','2019/08/29 10:00')
  create_review("Un travail de pro, fini la galère des douches trop 🥵 trop 🥶! 🛠⚙️🙏 ", "Le boulot est fait! le chat permet d'assurer sur l'intervention. N'hésitez vraiment pas.", 4, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 10:00','2019/08/27 11:00')
  create_review("Travail impeccable, un travail de pro, good style! 😃🛠⚙️🙏 ", "Un grand merci à #{bk.user.first_name} d'avoir répondu rapidemment! ", 5, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 11:00','2019/08/30 12:00')
  create_review("Good job 💪 merci beaucoup fixit", "J'avais une résa pour des clients Airbn'b, ouf! sauvé!", 3, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 12:00','2019/08/25 12:00')
  create_review("Le matin la galère 😱! j'essai la messagerie mais bon moi et la techno ça fait 2 alors, #{bk.user.first_name} m'a dit vous m'avez pas bien indiqué votre soucis", "Plus jamais, #{bk.user.first_name} se dit dispo mais propose de revenir dans 3 jours parce que je n'aurai pas indiqué la bonne chaudière..comme si!!!", 2, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 13:00','2019/09/02 14:00')
  create_review("Top 👏! Après Doctolib, maintenant Fix it trooop bien", "Le tchat permet de gagner du temps et de suivre en temps réel 😀", 4, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 14:00','2019/08/21 15:00')
  create_review("Super 👏🙏! Merci #{bk.user.first_name}!", "#{bk.user.first_name} est the plumber of family 👏", 5, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 15:00','2019/09/03 16:00')
  create_review("J'en ai révé, une app est là enfin fini la galère de chaudière! 🙏😃 ", "Merci à #{bk.user.first_name} d'être intervenu, je peux enfin prendre une douche chaude !", 4, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 16:00','2019/08/02 17:00')
  create_review("Super #{bk.user.first_name} 💪! je peux enfin faire ma vaisselle", "Très à l'écoute et efficace et tout ça grace à Fix it", 4, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 17:00','2019/08/01 18:00')
  create_review("Une perle! 💎 , le chat a permit une intervention rapide sans que je sois là, magique", "#{bk.user.first_name} a sauvé mon week-end..et mon couple", 4, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 18:00','2019/09/03 19:00')
  create_review("Merci Fix it! 👏🙏, enfin une douche chaude pour mes poussins", " #{bk.user.first_name} est sympa et pro, l'app assure avec le chat", 5, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 19:00','2019/08/28 20:00')
  create_review("Super #{bk.user.first_name} 💎!", "J'adoOore le tchat 👨‍💻", 5, bk)

  bk = create_booking(equipement_sample,pro,'error 404','elle tombe toujours en panne','2019/08/28 20:00','2019/08/28 21:00')
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

remi = create_client('remi','carette','0680782606','2 rue de condé','59000','La madeleine','https://ca.slack-edge.com/T02NE0241-UL79224P2-7a94c0d24580-48')

User.create!(
  email:        "moritz@fix-it.com",
  password:     'qwertz',
  first_name:   "moritz",
  last_name:    "michalak",
  phone:        "03 92 82 03 20",
  address:      "15 boulevard de la liberté",
  zip_code:     "59000",
  city:         "Lille",
  user_type:    'perso',
  photo:        'https://ca.slack-edge.com/T02NE0241-UL7BFB5QQ-0a2dc0a5ae19-48',
  company_name: ''
)

moritz = User.last

jacques = create_pro(
  'jacques',
  'Mimexa',
  '03 20 34 45 09',
  '2 rue de la grande chaussée',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=656&q=80',
  'ReparLil'
)

jacques.employees = "12"
jacques.save


renald = create_client(
  'renald',
  'HB',
  '03 20 21 22 23',
  '3 boulevard de la Liberté',
  '59000',
  'Lille',
  'https://ca.slack-edge.com/T02NE0241-UL7AQBP5E-2d8af2da19e6-48'
)



# CREATE EQUIPEMENTS & BOOKINGS TO DO SOME REVIEWS FOR JACQUES MIMEXA


equipement = create_equipement(renald, 'Chaffoteaux', 'chauffa', 'fonctionne')
bj = create_booking(equipement,jacques,'error 409','elle tombe toujours en panne','2019/09/03 07:00','2019/09/03 08:00')
create_review("Super plombier !", "Je vous le recommande chaudement, #{bj.user.first_name} est très bien", 3, bj)
r = Review.last
r.created_at = DateTime.parse("2019-09-04 09:00")
r.save

nicolas = create_client('nicolas','schmelzer','03 20 45 87 54','32 allée Nounours','59800','Lille','https://ca.slack-edge.com/T02NE0241-UL7JFQ0R3-3696ceb54c45-72')
equipement = create_equipement(nicolas, 'Vergne', 'Mark III', 'fonctionne')
bj2 = create_booking(equipement,jacques,'error 404','elle tombe toujours en panne','2019/09/01 08:00','2019/08/01 09:00')
create_review("Super!!", "Je vous recommande #{bj2.user.first_name}. Il est très efficace et sympa 🙏, la famille peut enfin prendre une douche!!", 4, bj2)
r2 = Review.last
r2.created_at = DateTime.parse("2019-09-02 07:00")
r2.save

faustine = create_client('faustine','lafaust','03 20 45 57 54','5 boulevard des pommes','59000','Lille','https://ca.slack-edge.com/T02NE0241-UL79LBN2U-c39e691544c6-72')
equipement = create_equipement(faustine, 'Weishaupt', 'Them +', 'fonctionne')
bj3 = create_booking(equipement, jacques,'erreur 450','elle tombe toujours en panne','2019/08/28 09:00','2019/08/29 10:00')
create_review("Top moumoute", "Un travail de pro, fini la galère des douches trop 🥵 trop 🥶! 🛠⚙️🙏 ", 5, bj3)
r3 = Review.last
r3.created_at = DateTime.parse("2019-08-28 11:00")
r3.save

marine = create_client('marine','hacki','03 20 65 87 54','76 rue Turing','59800','Lille','https://ca.slack-edge.com/T02NE0241-UL96Z3JUX-62eb1e8abb98-72')
equipement = create_equipement(marine, 'Chaffoteaux', 'chauffa', 'fonctionne')
bj4 = create_booking(equipement, jacques,'erreur 408','elle tombe toujours en panne','2019/08/26 10:00','2019/08/26 11:00')
create_review("Géeeenial", "Un grand merci à #{bj4.user.first_name} d'avoir répondu rapidemment! ", 4, bj4)
r4 = Review.last
r4.created_at = DateTime.parse("2019-08-27 08:00")
r4.save

jean = create_client('jean','kamarat','03 20 45 87 54','59 rue Lebanon','59000','Lille','https://ca.slack-edge.com/T02NE0241-UKVSSU5NE-c9a10bc9c700-72')
equipement = create_equipement(jean, 'Atlantic', 'Horizona', 'fonctionne')
bj5 = create_booking(equipement,jacques ,'erreur 509','elle tombe toujours en panne','2019/08/27 11:00','2019/08/27 12:00')
create_review("ouf", "Good job 💪 merci fixit, j'avais une résa pour des clients Airbn'b, ouf! sauvé!", 4, bj5)
r5 = Review.last
r5.created_at = DateTime.parse("2019-08-26 01:00")
r5.save

linus = create_client('linus','torvalds','03 20 45 87 54','10 avenue de Helsinski','59000','Lille','https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg/240px-LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg')
equipement = create_equipement(linus, 'Saunier Duval', 'Mira', 'fonctionne')
bj6 = create_booking(equipement,jacques,'erreur 409','elle tombe toujours en panne','2019/08/23 12:00','2019/08/23 13:00')
create_review("Mouai bof", "Le matin la galère 😱! Plus jamais, #{bj6.user.first_name} se dit dispo mais propose de revenir dans 3 jours parce que je n'aurai pas indiqué la bonne chaudière..comme si!!!", 2, bj6)
r6 = Review.last
r6.created_at = DateTime.parse("2019-08-24 19:00")
r6.save

simon = create_client('simon','northmen','03 20 45 17 52','62 avenue de Wozniak','59800','Lille','https://ca.slack-edge.com/T02NE0241-UL7B9TJRW-8ac16206f4ef-72')
equipement = create_equipement(simon, 'Frisquet', 'Thema', 'fonctionne')
bj7 = create_booking(equipement, jacques,'erreur 404','elle tombe toujours en panne','2019/08/20 15:00','2019/08/20 16:00')
create_review("Le web c'est trop bien", "Top 👏! Après Doctolib, maintenant Fix it trooop bien, le tchat permet de gagner du temps et de suivre en temps réel 😀", 4, bj7)
r7 = Review.last
r7.created_at = DateTime.parse("2019-08-20 21:00")
r7.save

yohann = create_client('sebastien','platini','03 20 25 82 54','10 boulevard de Lorraine','59000','Lille','https://ca.slack-edge.com/T02NE0241-U02NE0247-e4421ea8648d-48')
equipement = create_equipement(yohann, 'Viessmann', 'wasser', 'fonctionne')
bj8 = create_booking(equipement,jacques,'erreur 466','elle tombe toujours en panne','2019/08/19 14:00','2019/08/19 15:00')
create_review("Merci merci", "Super 👏🙏! Merci à #{bj8.user.first_name}! the plumber of family 👏", 5, bj8)
r8 = Review.last
r8.created_at = DateTime.parse("2019-08-19 21:00")
r8.save

pab = create_client('pierre-antoine','ive','03 20 48 82 54','1bis rue Pierre Mauroy','59800','Lille','https://ca.slack-edge.com/T02NE0241-UL0U0N3NV-f7cb9889f0c7-72')
equipement = create_equipement(pab, 'Saunier Duval', 'Mira', 'fonctionne')
bj9 = create_booking(equipement,jacques,'erreur 477','elle tombe toujours en panne','2019/08/17 15:00','2019/08/17 16:00')
create_review("C'est pas du bluff", "J'en ai révé, une app est là enfin fini la galère de chaudière! 🙏😃 Merci à #{bj9.user.first_name} d'être intervenu, je peux enfin prendre une douche chaude !", 4, bj9)
r9 = Review.last
r9.created_at = DateTime.parse("2019-08-17 21:00")
r9.save

sarah = create_client('sarah','tepas','03 20 44 82 57','10 allée de la madelon','59800','Lille','https://ca.slack-edge.com/T02NE0241-UL6V81HN0-310f612b9485-72')
equipement = create_equipement(sarah, 'Viessmann', 'wasser', 'fonctionne')
bj10 = create_booking(equipement, jacques,'erreur 478','elle tombe toujours en panne','2019/08/16 16:00','2019/08/16 17:00')
create_review("Super super", "Super #{bj10.user.first_name} 💪! je peux enfin faire ma vaisselle et tout ça grace à Fix it", 4, bj10)
r10 = Review.last
r10.created_at = DateTime.parse("2019-08-17 12:00")
r10.save

alexandre = create_client('alexandre','buddy','03 20 45 82 52','33 rue de Gironde','59000','Lille','https://ca.slack-edge.com/T02NE0241-UL12X27UZ-d1d5d66ec638-72')
equipement = create_equipement(alexandre, 'Weishaupt', 'Thema +', 'fonctionne')
bj11 = create_booking(equipement,jacques,'erreur 567','elle tombe toujours en panne','2019/08/13 17:00','2019/08/13 18:00')
create_review("Une perle!", " 💎 le chat permet une intervention rapide, magique..#{bj11.user.first_name} a sauvé mon week-end..et mon couple", 4, bj11)
r11 = Review.last
r11.created_at = DateTime.parse("2019-08-14 09:00")
r11.save

raphael = create_client('raphael','leonard','03 20 78 92 54','26 avenue des orties','59800','Lille','https://ca.slack-edge.com/T02NE0241-UKVUHDRPD-ad1f633af161-72')
equipement = create_equipement(raphael, 'Vergne', 'Mark III', 'fonctionne')
bj12 = create_booking(equipement,jacques,'erreur 455','elle tombe toujours en panne','2019/08/10 18:00','2019/09/10 19:00')
create_review("Merci Fix it! 👏🙏", "Enfin une douche chaude pour mes poussins et  #{bj12.user.first_name} est sympa et pro, l'app assure avec le chat", 5, bj12)
r12 = Review.last
r12.created_at = DateTime.parse("2019-08-11 12:00")
r12.save


barbara = create_client('barbara','exarchopoulos','03 20 45 83 95','45 rue de Marco Polo','59800','Lille','https://s2.qwant.com/thumbr/0x380/c/9/98fc63b568e16caf0f631656bf61da3488e5f3474e32cac98a6209040957cb/adele-exarchopoulos-844761l.jpg?u=http%3A%2F%2Fstatic.cinemagia.ro%2Fimg%2Fdb%2Factor%2F28%2F23%2F67%2Fadele-exarchopoulos-844761l.jpg&q=0&b=1&p=0&a=1')
equipement = create_equipement(barbara, 'Frisquet', 'Thema', 'fonctionne')
bj13 = create_booking(equipement,jacques,'erreur 456','elle tombe toujours en panne','2019/08/09 19:00','2019/08/09 20:00')
create_review("Super #{bj13.user.first_name} 💎!", "J'adoOore le tchat 👨‍💻", 5, bj13)
r13 = Review.last
r13.created_at = DateTime.parse("2019-08-10 9:00")
r13.save


maxime = create_client('maxime','nakamoto','03 20 51 51 51','51 avenue des Boers','59000','Lille','http://i.huffpost.com/gen/1664081/images/o-SATOSHI-NAKAMOTO-facebook.jpg')
equipement = create_equipement(maxime, 'Saunier Duval', 'Mira', 'fonctionne')
bj14 = create_booking(equipement,jacques,'erreur 411','elle tombe toujours en panne','2019/08/05 20:00','2019/08/05 21:00')
  create_review("Là c'est du niveau", "#{bj14.user.first_name} est vraiment pro et le chat permet d'anticiper l'intervention, thanks fix it 💎!", 4, bj14)
  r14 = Review.last
  r14.created_at = DateTime.parse("2019-08-06 13:00")
  r14.save


sebastien = create_client('seb','turing','03 20 09 67 86','24 rue des trains','59000','Lille','http://static1.businessinsider.com/image/5395f70feab8eae063e61436-1199-899/alan-turing-7.jpg')
equipement = create_equipement(sebastien, 'Chaffoteaux', 'chauffa', 'fonctionne')
bj15 = create_booking(equipement,jacques,'erruer 490','elle tombe toujours en panne','2019/08/02 08:00','2019/08/02 09:00')
create_review("Rassurant", "Super! Efficace et rassurant avec le chat et le technicien #{bj15.user.first_name} a été top!!", 5, bj15)
r15 = Review.last
r15.created_at = DateTime.parse("2019-08-03 20:00")
r15.save


boris = create_client('boris','evening','03 20 36 25 45','2 chemin du disco','59000','Lille','http://www.clipzik.com/images/posts/1181762143.jpg')
equipement = create_equipement(boris, 'Weishaupt', 'Thema +', 'fonctionne')
bj16 = create_booking(equipement,jacques,'erreur 409','elle tombe toujours en panne','2019/07/29 08:00','2019/07/29 09:00')
create_review("Super!", " efficace et rassurant avec le chat et le technicien #{bj16.user.first_name} a été top!!", 5, bj16)
r16 = Review.last
r16.created_at = DateTime.parse("2019-07-30 12:00")
r16.save


julien = create_client('julien','eclair','03 20 45 82 54','13 place Apollo','59800','Lille','http://i2.cdn.cnn.com/cnnnext/dam/assets/140715171130-buzz-aldrin-super-tease.jpg')
equipement = create_equipement(julien, 'Vergne', 'Mark III', 'fonctionne')
bj16 = create_booking(equipement,jacques,'erreur 444','elle tombe toujours en panne','2019/07/26 08:00','2019/07/26 09:00')
create_review("Le boulot est fait!", " Le chat permet d'assurer sur l'intervention. N'hésitez vraiment pas!!", 5, bj16)
r16 = Review.last
r16.created_at = DateTime.parse("2019-07-27 12:00")
r16.save


steve = create_client('steve','arbeito','03 20 45 90 54','2 boulevard de Cupertino','59800','Lille','http://cdn.macrumors.com/article-new/2015/03/Steve-Jobs-Movie.png?retina')
equipement = create_equipement(steve, 'Viessmann', 'wasser', 'fonctionne')
bj17 = create_booking(equipement,jacques,'erreur 444','elle tombe toujours en panne','2019/07/23 08:00','2019/07/23 09:00')
create_review("Après Super Mario, Super #{bj17.user.first_name}! 😂","Franchement grave super cool l'app avec la messagerie, OKLM!!", 5, bj17)
r17 = Review.last
r17.created_at = DateTime.parse("2019-07-24 09:00")
r17.save


marie = create_client('marie','currium','03 20 46 66 64','23 boulevard Pasteur','59000','Lille','https://images-na.ssl-images-amazon.com/images/M/MV5BNGQ3ZGZiMzQtMzkwYS00NzY1LTgxNjUtZjYyYzMxOWU0ZGZkXkEyXkFqcGdeQXVyMjQ3NzUxOTM@._V1_UY1200_CR109,0,630,1200_AL_.jpg')
equipement = create_equipement(marie, 'Saunier Duval', 'Mira', 'fonctionne')
bj18 = create_booking(equipement,jacques,'erreur 433','elle tombe toujours en panne','2019/07/20 08:00','2019/07/20 09:00')
create_review("Travail impeccable", "Un travail de pro, good style! 😃🛠⚙️🙏 #{bj18.user.first_name} a été top!!", 5, bj18)
r18 = Review.last
r18.created_at = DateTime.parse("2019-07-21 13:00")
r18.save

###########################################################################
#vive fix it vive #{bj6.user.first_name}!🙏😃"
#############################################



# CREATE 8 PRO



# create 6 pro on lille

daniel = create_pro(
  'Paul',
  'Van Haver',
  '0320642581',
  '8 place Charles de Gaulle',
  '59110',
  'Lille',
  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
  'BelgoPlomb'
)

nordin = create_pro(
  'Nordin',
  'Hateur',
  '0320000000',
  '27 rue des tours',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80',
  'Repar/Hateur'
)



michele = create_pro(
  'Michèle',
  'Hattubil',
  '0320000000',
  '10 rue de la grande chaussée',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1565794955623-d5baeab355a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
  'Chauff Lille'
)

rodolphe = create_pro(
  'Rodolphe',
  'Ramabah',
  '0320000000',
  '3 rue du Cure Saint-Etienne',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
  "Lil'chaud"
)

joseph = create_pro(
  'Joseph',
  'Giodo',
  '0320000000',
  "2 rue de l'église",
  '59160',
  'Lille',
  'https://images.unsplash.com/flagged/photo-1561530822-923d268fa0a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'ReparWell'
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
  'MS Repar'
)

abdel = create_pro(
  'Abdel',
  'Enclemt',
  '0320000000',
  "30 rue de l'alma",
  '59100',
  'Roubaix',
  'https://images.unsplash.com/photo-1543947431-982154385ed4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80',
  'Repartout'
)


# create 2 pro on Lille mais non dispo

mh = create_pro(
  'Marie-Hélène',
  'Linepo',
  '0320000000',
  '4 rue du Cure Saint-Etienne',
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1553271602-c8a96abf13e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'MHL ReparInstall'
)

estelle = create_pro(
  'Estelle',
  'Andraxele',
  '0320000000',
  "3 rue de l'église",
  '59800',
  'Lille',
  'https://images.unsplash.com/photo-1558499932-9609acb6f443?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  'EA chauffagiste'
)

# create equipements for remi

puts "create Equipement for remi"

# def create_equipement(user, brand, model, status)
#model : Frisquet", "Viessmann", "Chaffoteaux", "Atlantic", "Weishaupt", "Vergne", "Saunier Duval"
chauffa = create_equipement(remi, 'Chaffoteaux', 'Chauffo', 'panne')
thema_plus = create_equipement(remi, 'Weishaupt', 'thema plus', 'panne')
horizona = create_equipement(remi, 'Atlantic', 'Horizona', 'panne')
mira = create_equipement(remi, 'Saunier Duval', 'Mira', 'panne')
#equipement for moritz
chauffo = create_equipement(moritz, 'Chaffoteaux', 'Chauffo', 'panne')

#equipement for renald
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

koln = create_equipement(marine, 'Weishaupt', 'Koln', 'panne')
mark = create_equipement(marine, 'Vergne', 'Mark III', 'panne')
#equipement for sarah
mira = create_equipement(jean, 'Saunier Duval', 'Mira', 'panne')
wasser = create_equipement(jean, 'Viessmann', 'wasser', 'panne')
#equipement for alexandre
wasser = create_equipement(linus, 'Viessmann', 'wasser', 'panne')
thema = create_equipement(linus, 'Frisquet', 'thema 2', 'panne')

chauffa = create_equipement(remi, 'Chaffoteaux', 'Chauftout', 'panne')
thema_plus = create_equipement(remi, 'Weishaupt', 'thema plus', 'panne')
#equipement for raph
chauffo = create_equipement(moritz, 'Chaffoteaux', 'Chauffo', 'panne')
horizona = create_equipement(moritz, 'Atlantic', 'Horizona', 'panne')
#equipement for barbara
mira = create_equipement(renald, 'Saunier Duval', 'Mira', 'panne')
mark = create_equipement(renald, 'Vergne', 'Mark III', 'panne')
#equipement for maxime
thema = create_equipement(nicolas, 'Frisquet', 'thema 2', 'panne')
mark = create_equipement(nicolas, 'Vergne', 'Mark III', 'panne')

#equipement for
koln = create_equipement(marine, 'Weishaupt', 'Koln', 'panne')
mark = create_equipement(marine, 'Vergne', 'Mark III', 'panne')

#equipement for
mira = create_equipement(jean, 'Saunier Duval', 'Mira', 'panne')
wasser = create_equipement(jean, 'Viessmann', 'wasser', 'panne')

#equipement for
wasser = create_equipement(linus, 'Viessmann', 'wasser', 'panne')
thema = create_equipement(linus, 'Frisquet', 'thema 2', 'panne')


koln = create_equipement(marine, 'Weishaupt', 'Koln', 'panne')
mark = create_equipement(marine, 'Vergne', 'Mark III', 'panne')
#equipement for

mira = create_equipement(jean, 'Saunier Duval', 'Mira', 'panne')
wasser = create_equipement(jean, 'Viessmann', 'wasser', 'panne')
#equipement for
wasser = create_equipement(linus, 'Viessmann', 'wasser', 'panne')
thema = create_equipement(linus, 'Frisquet', 'thema 2', 'panne')


# def create_booking(equipement, pro, error_code, description, begin_string, end_string)

create_full_booking_before_with_reviews_and_notation(chauffa, mh, 4)
create_full_booking_before_with_reviews_and_notation(wasser, mh, 3)
create_full_booking_before_with_reviews_and_notation(horizona, mh, 2)
create_full_booking_before_with_reviews_and_notation(thema, mh, 4)
create_full_booking_before_with_reviews_and_notation(thema_plus, mh, 3)



create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/30 13:00','2019/08/30 14:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/30 14:00','2019/08/30 15:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/30 15:00','2019/08/30 16:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/30 16:00','2019/08/30 17:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/30 17:00','2019/08/30 18:00')

create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/31 07:00','2019/08/31 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/31 08:00','2019/08/31 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/31 09:00','2019/08/31 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/08/31 10:00','2019/08/31 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 11:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 12:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 13:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 14:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 15:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 16:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 18:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 19:00','2019/09/02 08:00')
create_booking(thema,mh,'error 404','elle tombe toujours en panne','2019/09/02 20:00','2019/09/02 08:00')

create_full_booking_before_with_reviews_and_notation(koln, estelle, 4)
create_full_booking_before_with_reviews_and_notation(thema, estelle, 4)
create_full_booking_before_with_reviews_and_notation(mira, estelle, 4)


# create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/08/30 13:00','2019/08/31 14:00')
# create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/08/30 14:00','2019/08/31 15:00')
create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/08/30 15:00','2019/08/31 16:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/08/30 16:00','2019/08/31 17:00')
# create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/08/30 17:00','2019/08/31 18:00')
# create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/08/30 18:00','2019/08/31 18:00')

create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/09/02 07:00','2019/09/02 08:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/02 08:00','2019/09/02 08:00')
create_booking(koln,estelle,'error 404','elle tombe toujours en panne','2019/09/02 09:00','2019/09/02 08:00')
create_booking(wasser,estelle,'error 404','elle tombe toujours en panne','2019/09/02 11:00','2019/09/02 08:00')
create_booking(mark,estelle,'error 404','elle tombe toujours en panne','2019/09/02 12:00','2019/09/02 08:00')
create_booking(thema,estelle,'error 404','elle tombe toujours en panne','2019/09/02 13:00','2019/09/02 08:00')
create_booking(chauffa,estelle,'error 404','elle tombe toujours en panne','2019/09/02 15:00','2019/09/02 08:00')
create_booking(horizona,estelle,'error 404','elle tombe toujours en panne','2019/09/02 16:00','2019/09/02 08:00')
create_booking(wasser,estelle,'error 404','elle tombe toujours en panne','2019/09/02 18:00','2019/09/02 08:00')
create_booking(mark,estelle,'error 404','elle tombe toujours en panne','2019/09/02 19:00','2019/09/02 08:00')
create_booking(chauffo,estelle,'error 404','elle tombe toujours en panne','2019/09/02 20:00','2019/09/02 08:00')





# nordin plombar

create_full_booking_today(thema ,nordin)
be1 = create_booking(thema,nordin,'error 404','elle tombe toujours en panne','2019/09/02 07:00','2019/09/02 08:00')
be2 = create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/02 08:00','2019/09/02 09:00')
be3 = create_booking(thema,nordin,'error 404','elle tombe toujours en panne','2019/09/02 09:00','2019/09/02 09:00')
create_review("Super plombier 🙏😃 !", "Je vous le recommande", 4, be1)
create_review("Excellent !", "Vive fix it ", 4, be2)
create_review("Peu mieux faire", "Retard, le technicien est énervé mais c'est réparé", 2, be3)
create_full_booking_before_with_reviews(thema, nordin)
create_full_booking_before_with_reviews(mira, nordin)
create_full_booking_before_with_reviews(thema, nordin)

#puts "create pro"

 #puts "Change reviews dates"




# #############################################################################################################################################

# 1=> MH

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, mh, 2)
create_full_booking_before_with_reviews_and_notation(mira, mh, 3)
create_full_booking_before_with_reviews_and_notation(mira, mh, 4)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, mh)

# CREATION 1 RDV LE LENDEMAIN
create_booking(mira,mh,'error 404','elle tombe toujours en panne','2019/09/05 08:00','2019/09/07 09:00')


# 2=> MOMO

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, momo, 3)
create_full_booking_before_with_reviews_and_notation(mira, momo, 3)
create_full_booking_before_with_reviews_and_notation(mira, momo, 4)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, momo)

# CREATION 2 RDV LE LENDEMAIN
create_booking(mira,momo,'error 404','elle tombe toujours en panne','2019/09/07 07:00','2019/09/07 09:00')
create_booking(mira,momo,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,momo,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/06 10:00')

# 3=> JOSEPH

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, joseph, 2)
create_full_booking_before_with_reviews_and_notation(mira, joseph, 3)
create_full_booking_before_with_reviews_and_notation(mira, joseph, 2)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, joseph)

# CREATION 2 RDV LE LENDEMAIN
create_booking(mira,joseph,'error 404','elle tombe toujours en panne','2019/09/07 07:00','2019/09/07 09:00')
create_booking(mira,joseph,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,joseph,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/07 10:00')
create_booking(mira,joseph,'error 404','elle tombe toujours en panne','2019/09/07 10:00','2019/09/07 11:00')

# 4=> ABDEL

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, abdel, 2)
create_full_booking_before_with_reviews_and_notation(mira, abdel, 3)
create_full_booking_before_with_reviews_and_notation(mira, abdel, 2)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, abdel)

# CREATION 2 RDV LE LENDEMAIN
create_booking(mira,abdel,'error 404','elle tombe toujours en panne','2019/09/07 07:00','2019/09/07 09:00')
create_booking(mira,abdel,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,abdel,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/07 10:00')
create_booking(mira,abdel,'error 404','elle tombe toujours en panne','2019/09/07 10:00','2019/09/07 11:00')
create_booking(mira,abdel,'error 404','elle tombe toujours en panne','2019/09/07 11:00','2019/09/07 11:00')

# 5=> MICHELE

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, michele, 4)
create_full_booking_before_with_reviews_and_notation(mira, michele, 4)
create_full_booking_before_with_reviews_and_notation(mira, michele, 2)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, michele)

# CREATION 2 RDV LE LENDEMAIN
create_booking(mira,michele,'error 404','elle tombe toujours en panne','2019/09/07 07:00','2019/09/07 09:00')
create_booking(mira,michele,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,michele,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/07 10:00')
create_booking(mira,michele,'error 404','elle tombe toujours en panne','2019/09/07 10:00','2019/09/07 11:00')
create_booking(mira,michele,'error 404','elle tombe toujours en panne','2019/09/07 11:00','2019/09/07 11:00')
create_booking(mira,michele,'error 404','elle tombe toujours en panne','2019/09/07 12:00','2019/09/07 11:00')

# 6=> NORDIN

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, nordin, 1)
create_full_booking_before_with_reviews_and_notation(mira, nordin, 3)
create_full_booking_before_with_reviews_and_notation(mira, nordin, 1)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, nordin)

# CREATION 2 RDV LE LENDEMAIN
create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/07 07:00','2019/09/07 09:00')
create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/07 10:00')
create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/07 10:00','2019/09/07 11:00')
create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/07 11:00','2019/09/07 11:00')
create_booking(mira,nordin,'error 404','elle tombe toujours en panne','2019/09/07 12:00','2019/09/07 11:00')


# 7=> ESTELLE

# CREATION NOTE MOYENNE
create_full_booking_before_with_reviews_and_notation(mira, estelle, 1)
create_full_booking_before_with_reviews_and_notation(mira, estelle, 3)
create_full_booking_before_with_reviews_and_notation(mira, estelle, 1)

# CREATION BOOKING FULL AUJOURDHUI

create_full_booking_today(mira, estelle)

# CREATION 2 RDV LE LENDEMAIN
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/07 07:00','2019/09/07 09:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/07 10:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/07 10:00','2019/09/07 11:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/07 11:00','2019/09/07 11:00')
create_booking(mira,estelle,'error 404','elle tombe toujours en panne','2019/09/07 12:00','2019/09/07 11:00')






################################ A VERIFIER AVANT DEMODAY


# 6=> JACQUES

# CREATION DES RDV LE JOUR MEME
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 08:00','2019/09/06 09:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 09:00','2019/09/06 10:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 10:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 11:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 12:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 13:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 14:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 15:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 16:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 17:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 18:00','2019/09/06 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/06 19:00','2019/09/06 11:00')

# CREATION DES RDV LE LENDEMAIN
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 08:00','2019/09/07 09:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 09:00','2019/09/07 10:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 11:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 12:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 13:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 15:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 16:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 17:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 18:00','2019/09/07 11:00')
create_booking(mira,jacques,'error 404','elle tombe toujours en panne','2019/09/07 19:00','2019/09/07 11:00')


# 7=> RODOLPHE

create_full_booking_before_with_reviews(mira, rodolphe)


# CREATION DES RDV LE JOUR MEME
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 08:00','2019/09/06 09:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 09:00','2019/09/06 10:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 10:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 11:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 12:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 13:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 14:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 15:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 16:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 17:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 18:00','2019/09/06 11:00')
create_booking(mira,rodolphe,'error 404','elle tombe toujours en panne','2019/09/06 19:00','2019/09/06 11:00')


puts "Create messages"

create_message(daniel, remi, "Je quitte mon rendez et arrive dans 10 min")
create_message(remi, daniel, "C'est noté, je préviens ma femme")

puts "#{User.count} users created"
puts "#{Skill.count} skills created"
puts "#{Equipement.count} equipements created"
puts "#{Booking.count} bookings created"
puts "#{Review.count} reviews created"
puts "#{Message.count} messages created"


