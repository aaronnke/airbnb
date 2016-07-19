class AddGuestsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :guests, :integer
  end
end
