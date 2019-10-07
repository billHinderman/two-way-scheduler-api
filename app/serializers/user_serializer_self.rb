class UserSerializerSelf < ActiveModel::Serializer
  attributes :key,
             :name,
             :email,
             :created_at
end
