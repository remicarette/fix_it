class Booking < ApplicationRecord
  belongs_to :equipement
  belongs_to :user

  validates :equipement, presence: true
  validates :user, presence: true
  validates :error_code, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ['annulé', 'refusé', 'en attente', 'validé', 'en cours', 'terminé'] }
  validates :begin, presence: true
end
