class MovieSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :year, :poster
  belongs_to :genre
  has_many :stars
end
