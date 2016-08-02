class SearchController < ApplicationController

	def search
		@query = params[:search][:query]
	  @entries_array = (Listing.search params[:search][:query], fields: [{location: :word_start}]).to_a
	  @daterange_array = ((params[:search][:daterange].slice(0..9).to_date)..(params[:search][:daterange].slice(13..22).to_date)).to_a
	  @entries_array.delete_if { |listing| 
	  	listing.reservations.any? do |reservation|
	  		((((reservation.start_date)..(reservation.end_date)).to_a) & @daterange_array).present?
	  	end
	  }
	  @listings = Kaminari.paginate_array(@entries_array).page(params[:page]).per(4)

	  respond_to do |format|
	  	format.html {
	  		render "listings/search"
	  	}
	  	format.js
  	end
	end

	def autocomplete
		@results = Listing.search(params[:term], fields: [{location: :word_start}], limit: 5).map(&:location).uniq
    render json: @results
  end

end
