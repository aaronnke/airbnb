class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.belongs_to :user, index: true
    	t.string :name
    	t.string :location
    	t.string :type
    	t.integer :price
    end
  end
end
