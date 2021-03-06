class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
    PaymentNotification.create!(:params => params, :ticket_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id] )
    TicketMailer.ticket_email(Ticket.find(params[:invoice])).deliver
    render :nothing => true
  end
end