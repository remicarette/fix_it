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
    "#{self.first_name.downcase.capitalize} #{self.last_name.downcase.capitalize}"
  end

  def availability_today
    Time.now.hour > 7 ? h = Time.now.hour : h = 7
    shifts_today = (h..18).to_a
    booked_today = self.bookings.select { |booking|
      booking.begin.day == Time.now.day
    }
    booked_today.each do |booking|
      shifts_today.delete(booking.begin.hour)
    end
    return shifts_today
  end

  def availability_tomorrow
    h = 7
    shifts_tomorrow = (h..18).to_a
    booked_tomorrow = self.bookings.select { |booking|
      booking.begin.day == Date.tomorrow.day
    }
    booked_tomorrow.each do |booking|
      shifts_tomorrow.delete(booking.begin.hour)
    end
    return shifts_tomorrow
  end

  def first_free_slot
    if self.availability_today == []
      return self.availability_tomorrow.first
    else
      return self.availability_today.first
    end
  end
end
  # def next_available_slot(pro)
  #   ty = Date.today
  #   tw = Date.tomorrow
  #   h_ty = (Time.now.to_s[11] + Time.now.to_s[12]).to_i
  #   h_tw = 7
  #   @availability_ty = []
  #   @availability_tw = []
  #   (18 - h_ty).times do
  #     @availability_ty << "#{ty} #{h_ty += 1}:00"
  #   end
  #   12.times do
  #     @availability_tw << "#{tw} #{h_tw += 1}:00"
  #   end
  #   booked_out = []
  #   pro.bookings.each do |booking|
  #     booked_out << "#{booking.begin.date} #{booking.begin.hour}:00"
  #   end
  #   booked_out.each do |booked|
  #     @availability_ty.delete(booked)
  #     @availability_tw.delete(booked)
  #   end
  #   if @availability_ty.nil?
  #     @availability_tw.nil? ? "Sorry, #{pro.full_name} is booked out" : "Disponible demain #{@availability_tw.first.slice(-5..-1)}"
  #   else
  #     return "Disponible aujourd'hui #{@availability_ty.first.slice(-5..-1)}"
  #   end
  # end

  # def availability_pros(pro)
  #   ty = Date.today
  #   tw = Date.tomorrow
  #   h_ty = (Time.now.to_s[11] + Time.now.to_s[12]).to_i
  #   h_tw = 7
  #   @availability_ty = []
  #   @availability_tw = []
  #   (18 - h_ty).times do
  #     @availability_ty << "#{ty} #{h_ty += 1}:00"
  #   end
  #   12.times do
  #     @availability_tw << "#{tw} #{h_tw += 1}:00"
  #   end
  #   booked_out = []
  #   pro.bookings.each do |booking|
  #     booked_out << booking.begin
  #   end
  #   booked_out.each do |booked|
  #     @availability_ty.delete(booked)
  #     @availability_tw.delete(booked)
  #   end
  #   if @availability_ty.nil?
  #     return @availability_tw.first
  #   else
  #     return @availability_ty.first
  #   end
  # end


  # create_table "users", force: :cascade do |t|
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "first_name"
  #   t.string "last_name"
  #   t.string "phone"
  #   t.string "address"
  #   t.string "zip_code"
  #   t.string "city"
  #   t.string "user_type"
  #   t.index ["email"], name: "index_users_on_email", unique: true
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
