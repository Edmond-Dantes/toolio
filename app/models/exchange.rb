class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user, :item, :start_date, :end_date, presence: true
  validates :user, uniqueness: { scope: :item }

  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date


  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before Start date")
    end
  end
end
