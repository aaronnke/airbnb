class ListingsController < ApplicationController
	before_action :require_login, only: [:edit, :update, :new, :create]
	before_action :set_listing, only: [:show, :edit, :update]
	before_action :find_user, only: :index

	def new
		@listing = Listing.new
	end

	def create

		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing #show path '/listings/:id'(listing_path(@listing))
		else
			render :new #render the new.html.erb again
		end
	end

	def index
		@listings = @user.listings
	end

	def show
		@reservation = current_user.reservations.where(listing_id: params[:id])
		if @reservation.empty?
			@reservation = Reservation.new
		else
			@reservation = @reservation[0]
		end
	end

	def edit
		# @listing = Listing.find(params[:id])
		#render edit.html.erb
	end

	def search
		@entries = Listing.order(:price).search params[:search][:query]
		@query = params[:search][:query]
		@paginatable_array = Kaminari.paginate_array(@entries).page(params[:page]).per(2)
	end

	def filter_search
		@tags = []
		params[:filter_search][:tags].each do |tag_id|
			if tag_id != ""
				@tags << Tag.find(tag_id.to_i).tag
			end
		end
		@here_listings = Listing.search(params[:filter_search][:location])
		@filtered_array = []
		@here_listings.each do |listing|
			if listing.tags.where(tag: @tags).size >= @tags.size
				@filtered_array << listing
			end
		end
		render json: @filtered_array
	end

		
	def live_search
		if params[:value] != ""
			@entries = Listing.search(params[:value])
		else
			@entries = "all"
		end
			render json: @entries
	end

	def update
		@tags = []
		params[:listing][:tags].each do |tag_id|
			if tag_id != ""
				tag = Tag.find(tag_id)
				@tags << tag
			end
		end

		@listing.tags=(@tags)

		@listing.update(listing_params)

		if @listing.save
			redirect_to @listing
		else
			render :edit
		end
	end


	private

  def listing_params
    params.require(:listing).permit(:name, :location, :listing_type, :price, :guests, :user_id, {photos: []})
  end

  def set_listing
  	@listing = Listing.find(params[:id])
  end

  def find_user
  	@user = User.find(params[:user_id])
  end
end
