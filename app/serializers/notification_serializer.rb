class NotificationSerializer < ActiveModel::Serializer
  has_many :payments , serializer: PaymentsSerializer 
  attributes :name, :cpf
end