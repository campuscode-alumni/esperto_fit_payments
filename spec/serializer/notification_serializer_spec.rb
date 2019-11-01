require 'rails_helper'
describe NotificationSerializer do
  context 'when create registration' do
    let (:registration) { create(:registration) }
    it 'return correct attributes' do
      registration.generate_anual_payments
      expect(described_class.new(registration).as_json).to eq ({
            "name":"Zé",
            "cpf":"123456",
            "payments":[
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 1.month).to_s, 
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 2.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 3.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 4.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 5.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 6.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 7.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 8.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 9.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 10.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 11.month).to_s,
                "status":"pending"
              },
              {
                "value":40.0,
                "dt_venc":(Time.zone.now.to_date + 12.month).to_s,  
               "status":"pending"
              }
            ]
          })
    end
  end
end