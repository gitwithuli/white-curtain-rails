# frozen_string_literal: true

class User < ActiveRecord::Base

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :follows
  has_many :followed_movies, through: :follows, source: :followable, source_type: "Movie"
  has_many :followed_genres, through: :follows, source: :followable, source_type: "Genre"
  has_many :followed_stars, through: :follows, source: :followable, source_type: "Star"

end
