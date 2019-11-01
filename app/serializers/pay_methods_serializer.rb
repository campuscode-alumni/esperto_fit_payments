class PayMethodsSerializer < ActiveModel::Serializer
  attributes :name, :tax, :limit_days 
end