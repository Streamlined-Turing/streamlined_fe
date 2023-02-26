require 'rails_helper'

RSpec.describe MediaService do
  describe '#media' do
    it 'returns details about a piece of media' do
      stub_request(:get, "http://localhost:5000/api/v1/media/3173903")
        .to_return(status: 200,
                   body: File.read('spec/fixtures/media1.json'),
                   headers: {})

      response = MediaService.media(3173903)

      expect(response[:data][:id]).to eq("3173903")
      expect(response[:data][:type]).to eq("media")
      expect(response[:data][:attributes][:id]).to be_a Integer
      expect(response[:data][:attributes][:title]).to be_a String
      expect(response[:data][:attributes][:audience_score]).to be_a Float
      expect(response[:data][:attributes][:rating]).to be_a String
      expect(response[:data][:attributes][:type]).to be_a String
      expect(response[:data][:attributes][:description]).to be_a String
      expect(response[:data][:attributes][:genres]).to be_a Array
      expect(response[:data][:attributes][:release_year]).to be_a Integer
      expect(response[:data][:attributes][:runtime]).to be_a Integer
      expect(response[:data][:attributes][:language]).to be_a String
      expect(response[:data][:attributes][:sub_services]).to be_a Array
      expect(response[:data][:attributes][:poster]).to be_a String
    end
  end
end
