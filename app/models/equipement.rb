class Equipement < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :status, presence: true, inclusion: { in: ['panne', 'fonctionne'] }

end
