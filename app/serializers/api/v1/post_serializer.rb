class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
end
