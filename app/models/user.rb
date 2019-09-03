class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # geocode
  geocoded_by :fulladdress
  after_validation :geocode, on: [:create, :update ]

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


  # def will_save_change_to_fulladress?
  #   self.fulladdress != fulladdress
  # end

  def fulladdress
    [address, city, zip_code].compact.join(', ')
  end

  def bookings_as_client
    self.equipements.map { |equipment| equipment.bookings}.flatten
  end

  def full_name
    "#{first_name.downcase.capitalize} #{last_name.downcase.capitalize}"
  end

  def average_stars_pro
    amount = self.reviews.count
    stars_pro = 0
    if amount != 0
      self.reviews.each do |review|
        stars_pro += review.stars
      end
      average_stars = stars_pro.fdiv(amount)
      return round_to_half(average_stars)
    else
      return 0
    end


  end

  # def availability(date)
    # for refactoring
  # end

  def availability_today
    Time.now.hour > 7 ? h = Time.now.hour + 1 : h = 7
    shifts_today = (h..20).to_a
    booked_today = self.bookings.select do |booking|
      booking.begin.day == Time.now.day
      # booking.begin.day == Date.today.day
    end
    booked_today.each do |booking|
      shifts_today.delete(booking.begin.hour)
    end
    return shifts_today
  end

  def availability_tomorrow
    shifts = (7..20).to_a
    booked_tomorrow = self.bookings.select do |booking|
      booking.begin.day == Date.tomorrow.day
    end
    booked_tomorrow.each do |booking|
      shifts.delete(booking.begin.hour)
      booking.begin.hour
    end
    shifts_tomorrow = []
    shifts.each do |dispo|
      shifts_tomorrow << dispo + 24
    end
    return shifts_tomorrow
  end

  def first_free_slot
    availability_today == [] ? availability_tomorrow.first : availability_today.first
  end

  def availabilities_choices
    collection = []
    availabilities = availability_today + availability_tomorrow

    availabilities.each do |number|
      if number < 24
        collection << ["Aujourd'hui à #{number}h", "#{Time.now.year}/#{Time.now.month}/#{Time.now.day} #{number}:00"]
      else
        collection << ["Demain à #{number - 24}h", "#{Date.tomorrow.year}/#{Date.tomorrow.month}/#{Date.tomorrow.day} #{number -24 }:00"]
      end
    end
    return collection
  end
end
