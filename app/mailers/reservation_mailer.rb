class ReservationMailer < ApplicationMailer
	default from: "aaron@jobi.co"

	def booking_email(customer, host, reservation)
		@customer = customer
		@host = host
		@reservation = reservation
		# @url = listing_url(reservation.listing_id)

		mail(to: @host.email, subject: "#{@host.name}, you have a booking for #{@reservation.listing.name} from #{@customer.name}!")
	end
end

