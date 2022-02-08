class RemoveAvailabilityFromCampers < ActiveRecord::Migration[6.1]
  def change
    remove_column :campers, :availability, :boolean
  end
end
