class Booking < ApplicationRecord
  belongs_to :equipement
  belongs_to :user
end
