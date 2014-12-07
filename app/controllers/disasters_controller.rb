class DisastersController < ApplicationController
def index
    render json: Disaster.page(1).per_page(50)
  end

  def ranking
    render json: Disaster.ranking_for(params[:id])
  end
end
