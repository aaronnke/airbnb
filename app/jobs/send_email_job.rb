class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user, host, reservation)
    @user = user
    @host = host
    @reservation = reservation
    ReservationMailer.booking_email(@user, @host, @reservation).deliver
  end


end
