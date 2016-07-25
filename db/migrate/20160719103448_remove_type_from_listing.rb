class RemoveTypeFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :type, :string
  end
end
