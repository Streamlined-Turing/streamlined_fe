require 'rails_helper'

<<<<<<< HEAD
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
      expect(response[:data][:attributes][:trailer]).to be_a String
      expect(response[:data][:attributes][:trailer_thumbnail]).to be_a String
    end
  end
end
=======
RSpec.describe 'Media Service' do 
  describe '.media_search' do 
    before(:each) do 
      stub_request(:get, "http://localhost:5000/api/v1/media?q=bad")
        .to_return(status: 200, body: File.read('./spec/fixtures/search_movies_response.json'), headers: {})
    end

    it 'returns a response with the media results' do 
      response = MediaService.media_search('bad')

      expect(response).to have_key(:data)
      expect(response[:data]).to be_an Array
      expect(response[:data][0]).to have_key(:id)
      expect(response[:data][0]).to have_key(:type)
      expect(response[:data][0]).to have_key(:attributes)
      expect(response[:data][0][:attributes]).to have_key(:id)
      expect(response[:data][0][:attributes]).to have_key(:title)
      expect(response[:data][0][:attributes]).to have_key(:audience_score)
      expect(response[:data][0][:attributes]).to have_key(:rating)
      expect(response[:data][0][:attributes]).to have_key(:type)
      expect(response[:data][0][:attributes]).to have_key(:description)
      expect(response[:data][0][:attributes]).to have_key(:genres)
      expect(response[:data][0][:attributes]).to have_key(:release_year)
      expect(response[:data][0][:attributes]).to have_key(:runtime)
      expect(response[:data][0][:attributes]).to have_key(:language)
      expect(response[:data][0][:attributes]).to have_key(:sub_services)
      expect(response[:data][0][:attributes]).to have_key(:poster)
    end
  end
end
>>>>>>> 78d1ed6d37a3669bfe0fef100a33365a367c0bef
