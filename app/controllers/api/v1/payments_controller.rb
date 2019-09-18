class Api::V1::PaymentsController < Api::V1::ApiController
  def show
    @payments = Registration.find_by!(cpf: params[:id])
    render json: @payments, only: :cpf , status: :ok , include: {payments:{only: %i[value dt_venc status]}}
  end

  def ban
    @payments = Registration.find_by!(cpf: params[:cpf])
    @payments.payments.each do |payment|
      if payment.status == 'pending' 
        payment.update(status: :canceled)
      end
    end
    render json: { msg: "CPF #{@payments.cpf} com todas as suas faturas canceladas" }, status: :ok
  end
end
