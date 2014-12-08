class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def create
    disaster = Disaster.find_by create_params
    if disaster.present?
      @donation = Donation.new(
        user: current_user,
        disaster: disaster,
        amount: params[:amount],
        country: (current_user.city.country rescue '')
      )
      @donation.save
    end

    redirect_to :root
  end

  def user_ranking
    render json: Donation.user_ranking
  end

  private

  def create_params
    params.require(:disaster).permit(:original_id)
  end
end
