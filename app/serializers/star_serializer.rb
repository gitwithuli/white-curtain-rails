class StarSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
end
