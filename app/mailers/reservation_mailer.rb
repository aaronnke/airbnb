class ReservationMailer < ApplicationMailer
	default from: "aaron@jobi.co"

	def booking_email(customer, host, reservation)
		@customer = customer
		@host = host
		@reservation = reservation
		# @url = listing_url(reservation.listing_id)
		# @url = "http://localhost:3000/listings/" + reservation.listing.id.to_s

		mail(to: @host.email, subject: "#{@host.name}, you have a booking for #{@reservation.listing.name} from #{@customer.name}!")
	end
end

