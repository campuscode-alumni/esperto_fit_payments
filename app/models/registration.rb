class Registration < ApplicationRecord
  
  belongs_to :plan
  belongs_to :unity
  belongs_to :pay_method

  has_many :payments
  has_many :clients_classes
  has_many :single_classes, through: :clients_classes

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness: true

  # def search_registration_payments(cpf)
  #   @registration = Registration.
  # end
  def generate_anual_payments
    12.times do |i|
      payments.new(pay_method_id: pay_method_id, value: plan.value , dt_venc: Time.zone.now.to_date + i.month).save
    end
  end

end
