# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
	def sample_mail_preview
    ReservationMailer.booking_email(User.last, User.first, Reservation.last)
  end
end
