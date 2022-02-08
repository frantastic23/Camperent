class AddCapacityToCampers < ActiveRecord::Migration[6.1]
  def change
    add_column :campers, :capacity, :integer
  end
end
