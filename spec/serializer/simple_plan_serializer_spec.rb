require 'rails_helper'
describe SimplePlanSerializer do
  context 'when send plan' do
    let (:plan) { create(:plan) }
    it 'return correct attributes' do
      expect(described_class.new(plan).as_json).to eq ({
        "id":plan.id,
        "name":"Executivo",
        "value":40.0
      })
    end
  end
end