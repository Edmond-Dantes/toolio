class Item < ApplicationRecord
  belongs_to :user
  has_one :exchange
  mount_uploader :photo, PhotoUploader
  validates :token_value, :name, :photo, presence: true

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
