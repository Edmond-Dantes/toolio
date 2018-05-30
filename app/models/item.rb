class Item < ApplicationRecord
  belongs_to :user
  has_one :exchange
  mount_uploader :photo, PhotoUploader
  validates :token_value, :name, :photo, presence: true
end
