require 'rails_helper'

RSpec.describe 'Media Service' do 
  describe '.media_search' do 
    it 'returns a response with the media results' do 
      stub_request(:get, "http://localhost:5000/api/v1/media?q=bad")
        .to_return(status: 200, body: File.read('./spec/fixtures/search_media_response.json'), headers: {})

      response = MediaService.media_search('bad')

      expect(response).to have_key(:data)
      expect(response[:data]).to be_an Array
      expect(response[:data][0]).to have_key(:id)
      expect(response[:data][0]).to have_key(:type)
      expect(response[:data][0][:type]).to eq("media")
      expect(response[:data][0]).to have_key(:attributes)
      expect(response[:data][0][:attributes]).to have_key(:id)
      expect(response[:data][0][:attributes]).to have_key(:title)
      expect(response[:data][0][:attributes]).to have_key(:audience_score)
      expect(response[:data][0][:attributes]).to have_key(:rating)
      expect(response[:data][0][:attributes]).to have_key(:media_type)
      expect(response[:data][0][:attributes]).to have_key(:description)
      expect(response[:data][0][:attributes]).to have_key(:genres)
      expect(response[:data][0][:attributes]).to have_key(:release_year)
      expect(response[:data][0][:attributes]).to have_key(:runtime)
      expect(response[:data][0][:attributes]).to have_key(:language)
      expect(response[:data][0][:attributes]).to have_key(:sub_services)
      expect(response[:data][0][:attributes]).to have_key(:poster_path)
    end
  end

  describe '.trending_media_search' do 
    it 'returns a response with the trending media' do
      stub_request(:get, "http://localhost:5000/api/v1/trending_media")
        .to_return(status: 200, body: File.read('./spec/fixtures/trending_media_response.json'), headers: {})
    
    response = MediaService.trending_media_search 

    expect(response).to have_key(:data)
    expect(response[:data]).to be_an Array
    expect(response[:data].size).to eq 3
    expect(response[:data][0]).to have_key(:id)
    expect(response[:data][0]).to have_key(:type)
    expect(response[:data][0][:type]).to eq("trending_media")
    expect(response[:data][0]).to have_key(:attributes)
    expect(response[:data][0][:attributes]).to have_key(:id)
    expect(response[:data][0][:attributes]).to have_key(:title)
    expect(response[:data][0][:attributes]).to have_key(:media_type)
    expect(response[:data][0][:attributes]).to have_key(:vote_average)
    expect(response[:data][0][:attributes]).to have_key(:poster_path)
    end 
  end 
end