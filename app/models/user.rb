class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # geocode
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # relations
  has_many :skills, dependent: :destroy
  has_many :equipements, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, length: { minimum: 10 }
  validates :address, presence: true, length: { minimum: 10 }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :user_type, presence: true, inclusion: { in: %W(pro perso) }

  def bookings_as_client
    self.equipements.map { |equipment| equipment.bookings}.flatten
  end

  def full_name
    "#{first_name.downcase.capitalize} #{last_name.downcase.capitalize}"
  end

  def availabilities_choices
    collection = []
    availabilities = availability_today + availability_tomorrow
    availabilities.each do |number| 
      if number < 24
        collection << ["Aujourd'hui à #{number}h", "#{Time.now.year}/#{Time.now.month}/#{Time.now.month} #{number}:00"]
      else
        collection << ["Demain à #{number - 24}h", "#{Date.tomorrow.year}/#{Time.now.month}/#{Time.now.month} #{number}:00"]
      end
    end
    return collection
  end
end
