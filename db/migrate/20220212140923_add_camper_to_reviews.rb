class AddCamperToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :camper, null: false, foreign_key: true
  end
end
