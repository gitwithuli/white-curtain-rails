class Api::V1::GenresController < Api::V1::BaseController
   before_action :authenticate_user, only: [:follow, :unfollow]

  def index
    render json: GenreSerializer.new(Genre.all).serialized_json
  end

  def follow
    genre = Genre.find(params[:genre_id])
    current_user.followed_genres.push genre
    render json: GenreSerializer.new(current_user.followed_genres).serialized_json
  end

  def unfollow
    Follow.where(user_id: current_user.id, followable_type: "Genre",
      followable_id: params[:genre_id]).first.destroy
    render json: GenreSerializer.new(current_user.followed_genres).serialized_json
  end
end
