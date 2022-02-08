class AddGearToCampers < ActiveRecord::Migration[6.1]
  def change
    add_column :campers, :gear, :string
  end
end
