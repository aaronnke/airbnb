class PurchasesController < ApplicationController

  def new
  	@client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:listing_id])
    @purchase = Purchase.new
  end

    def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: 'fake-valid-nonce',
    )

    if result.success?
    	Purchase.create(reservation_id: params[:purchase][:reservation_id])
  	end

    # reserve to save the transaction details into database

    redirect_to listing_path(Reservation.find(params[:purchase][:reservation_id]).listing)
  end

end
