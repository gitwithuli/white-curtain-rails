class Api::V1::GenresController < Api::V1::BaseController
   before_action :authenticate_user, only: [:follow, :unfollow]

  def index
    render json: GenreSerializer.new(Genre.all).serializable_hash
  end

  def follow
    genre = Genre.find(params[:genre_id])
    current_api_v1_user.followed_genres.push genre
    render json: GenreSerializer.new(current_api_v1_user.followed_genres).serializable_hash
  end

  def unfollow
    Follow.where(user_id: current_api_v1_user.id, followable_type: "Genre",
      followable_id: params[:genre_id]).first.destroy
    render json: GenreSerializer.new(current_api_v1_user.followed_genres).serializable_hash
  end
end
