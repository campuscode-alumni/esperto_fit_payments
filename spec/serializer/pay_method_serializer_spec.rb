require 'rails_helper'

describe PayMethodsSerializer do
  context 'when send pay methods' do
    it 'return all pay methods available' do
      create(:pay_method, name: "Boleto") 
      create(:pay_method, name: "Cartão de Crédito") 
      create(:pay_method, name: "Bitcoin")
      expect(PayMethod.all.map do   |payMethod|  
                described_class.new(payMethod).as_json
                end).to eq (
                            [
                              {
                                "name":"Boleto",
                                "tax":0.0,
                                "limit_days":15
                              },
                              {
                                "name":"Cartão de Crédito",
                                "tax":0.0,
                                "limit_days":15
                              },
                              {
                                "name":"Bitcoin",
                                "tax":0.0,
                                "limit_days":15
                              }
                            ]
                            )
    end
  end
end
