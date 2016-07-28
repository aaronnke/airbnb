class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
    	t.belongs_to :reservation
    	t.timestamps null: false
    end
  end
end
