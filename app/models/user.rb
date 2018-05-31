class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :location
  has_many :exchanges, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :lender_exchanges, through: :items, source: :exchange
  validates :username, presence: true, uniqueness: true
  #validates :location
end
