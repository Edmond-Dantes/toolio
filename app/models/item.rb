class Item < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :token_value, :name, :photo, presence: true
end
