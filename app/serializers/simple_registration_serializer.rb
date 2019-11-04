class SimpleRegistrationSerializer < ActiveModel::Serializer
  has_one :registration, serializer: RegistrationSerializer
  has_many :payments, serializer: CompletePaymentsSerializer

  def registration
    object
  end
end
