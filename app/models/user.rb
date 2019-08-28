class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills, dependent: :destroy
  has_many :equipements, dependent: :destroy
  has_many :bookings, through: :equipements

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, length: { minimum: 10 }
  validates :address, presence: true, length: { minimum: 10 }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :user_type, presence: true, inclusion: { in: %W(pro perso) }

  def full_name
    "#{self.first_name.downcase.capitalize} #{self.last_name.downcase.capitalize}"
  end
end

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
