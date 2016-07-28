class Reservation < ActiveRecord::Base

	belongs_to :listing
	belongs_to :user
	has_one :purchase

end
