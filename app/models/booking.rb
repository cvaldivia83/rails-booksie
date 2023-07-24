class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "End date must be later than start date")
    end
  end
end
