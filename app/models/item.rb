class Item < ApplicationRecord
  belongs_to :user

  validates :token_value, :name, :photo, presence: true
end
