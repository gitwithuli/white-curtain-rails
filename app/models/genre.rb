class Genre < ApplicationRecord
  has_many :movies, dependent: :destroy

  include Followable
end
