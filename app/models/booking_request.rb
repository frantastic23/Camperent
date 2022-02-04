class BookingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :camper
  validates :user, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates :cost, presence: true
  validates :date_from, date: { on_or_after: Date.current }
  validates_date :date_to, date: { after: :date_from }
  validates_each :camper do |record, attr, value|
    record.errors.add(attr, 'camper is not available for booking') unless value.available?(:date_from, :date_to)
  end
end
