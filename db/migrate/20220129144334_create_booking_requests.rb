class CreateBookingRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_requests do |t|
      t.string :date_from
      t.string :date_to
      t.references :user, null: false, foreign_key: true
      t.references :camper, null: false, foreign_key: true

      t.timestamps
    end
  end
end
