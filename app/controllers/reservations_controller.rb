class ReservationsController < ApplicationController
	before_action :require_login

	def index
		@reservations = current_user.reservations
	end

	def new
	end

	def bookings
	end

	def create
		booked = false
		@listing = Listing.find(params[:listing_id])
		unless @listing.reservations.empty?
			@listing.reservations.each do |reservation|
				booked = true if ((reservation.start_date..reservation.end_date).include?(params[:daterange].slice(0..9).to_date))
				booked = true if ((reservation.start_date..reservation.end_date).include?(params[:daterange].slice(13..22).to_date))
			end
		end

		if booked == false
			@reservation = current_user.reservations.new
			@reservation.listing_id = params[:listing_id]
			@reservation.start_date = params[:daterange].slice(0..9)
			@reservation.end_date = params[:daterange].slice(13..22)
			@reservation.save

			ReservationMailer.booking_email(current_user, @listing.user, @reservation).deliver_later
			# SendEmailJob.perform_later(current_user, @listing.user, @reservation)
			render json: { head: :ok }
		else
			render json: "not a json"
		end

	end

	def update
		booked = false
		@listing = Listing.find(params[:listing_id])
		unless @listing.reservations.empty?
			@listing.reservations.each do |reservation|
				booked = true if ((reservation.start_date..reservation.end_date).include?(params[:daterange].slice(0..9).to_date))
				booked = true if ((reservation.start_date..reservation.end_date).include?(params[:daterange].slice(13..22).to_date))
			end
		end

		if booked == false
			@reservation = current_user.reservations.where(listing_id: params[:listing_id])[0]
			@reservation.start_date = params[:daterange].slice(0..9)
			@reservation.end_date = params[:daterange].slice(13..22)
			@reservation.save

			ReservationMailer.booking_email(current_user, @listing.user, @reservation).deliver_later
			# SendEmailJob.perform_later(current_user, @listing.user, @reservation)
			render json: { head: :ok }
		else
			render json: "not a json"
		end
	end

	def show
	end

	def destroy
	end

end
