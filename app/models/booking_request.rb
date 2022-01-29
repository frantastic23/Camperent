class BookingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :camper
end
