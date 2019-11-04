class RegistrationSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :unity_id, :plan_id, :pay_method_id
end
