class Booking < ApplicationRecord
  belongs_to :equipement
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :equipement, presence: true
  validates :user, presence: true
  validates :error_code, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :begin, presence: true

  BOOKING_STATUS = ['En attente', 'Accepté', 'Programmé', 'En cours', 'Terminé']

  def client
    self.equipement.user
  end

  def pro
    self.user
  end

  def booking_status
    BOOKING_STATUS[self.status]
  end

  def next_status
    BOOKING_STATUS[self.status + 1]
  end

  def progress
    case self.status
    when 0
      "Votre demande d'intervention a été transmise"
    when 1
      "L'entreprise a pris en charge votre demande"
    when 2
      "Le rendez-vous est validé le #{self.begin.strftime('%d/%m/%Y à %R') }"
    when 3
      "Le technicien est en route"
    when 4
      "Merci de votre confiance !"
    end
  end


end
