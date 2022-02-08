class AddFuelToCampers < ActiveRecord::Migration[6.1]
  def change
    add_column :campers, :fuel, :string
  end
end
