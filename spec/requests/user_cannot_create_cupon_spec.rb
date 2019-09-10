require 'rails_helper'

describe 'user cannot create cupon'do 
  it 'successfully' do 
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', cupom_number: 10)
    post "/promotions/#{carnaval.id}/cupons"

    expect(response.status).to eq 302
    expect(response.body).to redirect_to(new_user_session_path)
  end
  
  it 'successfully in access denied' do 
    carnaval = create(:promotion, name:'Carnaval', cod_promotion: 'CARNA', cupom_number: 10)
    user = create(:user)
    login_as(user, scope: :user)
    post "/promotions/#{carnaval.id}/cupons"

    expect(response.status).to eq 302
    expect(response.body).to redirect_to(root_path)
  end
end