class CreateListingsTagsJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :listings, :tags do |t|
      t.index :listing_id
      t.index :tag_id
    end
  end
end
