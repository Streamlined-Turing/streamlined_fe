require 'rails_helper' 

RSpec.describe MediaFacade do 
  describe '.search_results' do 
    it 'can return a collection of a maximum of 15 media result objects' do 
      stub_request(:get, "http://localhost:5000/api/v1/media?q=bad")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movies_response.json'), headers: {})

      all_media_results = MediaFacade.search_results('bad')

      expect(all_media_results).to be_an Array 
      expect(all_media_results.count).to be <= 15
      
      all_media_results.each do |media|
        expect(media).to be_an_instance_of(MediaResult)
      end
    end
  end

  describe '.trending_media' do 
    it 'can return a collection of trending media result objects' do 
      stub_request(:get, "http://localhost:5000/api/v1/trending_media")
        .to_return(status: 200, body: File.read('./spec/fixtures/trending_media_response.json'), headers: {})

      trending_media_results = MediaFacade.trending_media 

      expect(trending_media_results).to be_an Array 
      
      trending_media_results.each do |media|
        expect(media).to be_an_instance_of(MediaResult)
      end
    end
  end
end