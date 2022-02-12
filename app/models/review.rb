class Review < ApplicationRecord
  belongs_to :camper
  validates :content, presence: true
  validates :stars, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false}
end
