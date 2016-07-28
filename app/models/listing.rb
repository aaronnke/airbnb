require 'elasticsearch/model'

class Listing < ActiveRecord::Base

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  searchkick word_start: [:location]

	belongs_to :user
	has_many :reservations
	has_and_belongs_to_many :tags	
	mount_uploaders :photos, PhotoUploader


	# def self.search(query)
	#   __elasticsearch__.search(
	#     query: { query_string: {
 #    		query: "#{query}*"
 #  		}}
	#   )
	# end

	
	# def self.search(query)
	# 	where("location LIKE ?", "#{query}%") # add more params here for listing filtering (not tags)
	# end
end

Listing.import force: true # for auto sync model with elastic search
