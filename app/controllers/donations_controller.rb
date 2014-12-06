class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def create
    disaster = Disaster.find_or_create params[:disaster]
    @donation = Donation.new(user: current_user, disaster: disaster, amount: params[:amount])
    @donation.save

    render json: @donation
  end
end
