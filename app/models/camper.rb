class Camper < ApplicationRecord
  belongs_to :user
  has_many :booking_requests, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [:address],
    using: {
      tsearch: { prefix: true }
    }


  # d - m - Y
  def available?(date_from, date_to)
    bs = booking_requests.select do |b|
      (date_from >= b.date_from && date_from <= b.date_to) ||
        (date_to >= b.date_from && date_to <= b.date_to)
    end
    return bs.empty?
  end
end
