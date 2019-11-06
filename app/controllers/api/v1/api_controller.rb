class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
    Rails.logger.error('TEM UM ERRO AQUI')
      render json: 'Não encontrado', status: :not_found
  end
end
