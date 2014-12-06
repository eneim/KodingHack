class DisastersController < ApplicationController
  before_action :set_disaster, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @disasters = Disaster.all
    respond_with(@disasters)
  end

  def show
    respond_with(@disaster)
  end

  def new
    @disaster = Disaster.new
    respond_with(@disaster)
  end

  def edit
  end

  def create
    @disaster = Disaster.new(disaster_params)
    @disaster.save
    respond_with(@disaster)
  end

  def update
    @disaster.update(disaster_params)
    respond_with(@disaster)
  end

  def destroy
    @disaster.destroy
    respond_with(@disaster)
  end

  def ranking
    render json: Disaster.ranking_for(params[:id])
  end

  private
    def set_disaster
      @disaster = Disaster.find(params[:id])
    end

    def disaster_params
      params.require(:disaster).permit(:title, :desc, :original_id)
    end
end
