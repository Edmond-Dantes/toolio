class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exchanges, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  #validates :location
end
