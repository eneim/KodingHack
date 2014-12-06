class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def create
    disaster = Disaster.find_or_create_by create_params
    @donation = Donation.new(
      user: current_user,
      disaster: disaster,
      amount: params[:amount],
      country: current_user.city.country
    )
    @donation.save

    render json: @donation.attributes.slice('amount', 'country')
  end

  private

  def create_params
    params.require(:disaster).permit(:original_id, :name, :desc)
  end
end
