class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user, :item, :start_date, :end_date, presence: true
  validates :user, uniqueness: { scope: :item }
end
