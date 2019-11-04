require 'rails_helper'

describe SimpleUnitySerializer do
  context 'when send unities' do
    it 'return all unities available' do
      create(:unity) 
      expect(Unity.all.map do   |unity|  
                described_class.new(unity).as_json
                end).to eq (
                            [
                              {
                                "id":Unity.first.id,
                                "name":"Paulista"
                              }
                            ]
                            )
    end
  end
end
