class PaymentsSerializer < ActiveModel::Serializer
  attributes :status, :value, :dt_venc

  def dt_venc
    object.dt_venc.to_s
  end
end