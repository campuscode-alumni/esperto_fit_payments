class CompletePaymentsSerializer < ActiveModel::Serializer
  attributes :id, :value, :dt_venc, :registration_id, :pay_method_id, :status
  def dt_venc
    object.dt_venc.to_s
  end
end
