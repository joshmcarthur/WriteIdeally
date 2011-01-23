class InvitationsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @invitation = {:user => current_user, :friends_email => params[:email]}
    WriteIdeallyMailer.invite(@invitation).deliver
    flash[:notice] = "Invitation sent to #{@invitation[:friends_email]}! Thanks for believing in our service!"
    redirect_to '/'
  end
end

