class Api::V1::StarsController < Api::V1::BaseController
   before_action :authenticate_user, only: [:follow, :unfollow]

  def index
    render json: StarSerializer.new(Star.all, {include: [:movies]}).serialized_json
  end

  def follow
    star = Star.find(params[:star_id])
    current_user.followed_stars.push star
    render json: StarSerializer.new(current_user.followed_stars).serialized_json
  end

  def unfollow
    Follow.where(user_id: current_user.id, followable_type: "Star",
      followable_id: params[:star_id]).first.destroy
    render json: StarSerializer.new(current_user.followed_stars).serialized_json
  end
end
