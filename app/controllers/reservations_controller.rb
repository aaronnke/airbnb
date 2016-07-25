class ReservationsController < ApplicationController
	before_action :require_login

	def index
		@reservations = current_user.reservations
	end

	def new
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
			redirect_to request.referrer
		else
			@error = "Sorry, it's been booked at these dates. Our developer is too noob to prevent you from selected already-booked dates, so take another wild guess!"
			render json: @error
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
			redirect_to request.referrer
		else
			@error = "Sorry, it's been booked at these dates. Our developer is too noob to prevent you from selected already-booked dates, so take another wild guess!"
			render json: @error
		end
	end

	def show
	end

	def destroy
	end

end
