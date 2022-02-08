class AddAddressToCampers < ActiveRecord::Migration[6.1]
  def change
    add_column :campers, :address, :string
  end
end
