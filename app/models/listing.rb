class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_and_belongs_to_many :tags	
	mount_uploaders :photos, PhotoUploader
	
	def self.search(query)
		where("location LIKE ?", "#{query}%") # add more params here for listing filtering (not tags)
	end
end
