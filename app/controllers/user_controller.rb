class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    user_json = current_user.attributes.slice("image", "name")
    user_json['city'] = current_user.city.attributes.slice("original_id", "latitude", "longitude", "name", "country")

    render json: user_json
  end
end
