class Item < ApplicationRecord
  belongs_to :user
  has_one :exchange

  validates :token_value, :name, :photo, presence: true
end
