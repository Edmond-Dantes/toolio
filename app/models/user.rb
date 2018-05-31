class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :location
  has_many :exchanges, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :lender_exchanges, through: :items, source: :exchange

  validates :username, presence: true, uniqueness: true
  validates :location, presence: true
  after_validation :geocode , if: :will_save_change_to_location?
end
