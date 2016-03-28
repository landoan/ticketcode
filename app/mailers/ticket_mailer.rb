class TicketMailer < ApplicationMailer
  default from: "admin@tickercoder.com"

  def send_message_email(event ,recipient, order)
    @event = event
    @recipient = recipient
    @order = order
    mail(to: recipient.email, subject: '[Ticket Coder] Booking Information ' + recipient.name)

  end
end
