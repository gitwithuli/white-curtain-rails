module Followable
  extend ActiveSupport::Concern
  included do
    has_many :follows, as: :followable
    has_many :users, through: :follows
  end


end
