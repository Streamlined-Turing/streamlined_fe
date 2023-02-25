require 'rails_helper' 

RSpec.describe MediaFacade do 
  describe '.search_results' do 
    it 'can return a collection of media result objects' do 
      stub_request(:get, "http://localhost:5000/api/v1/media?q=bad")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movies_response.json'), headers: {})

      all_media_results = MediaFacade.search_results('bad')

      expect(all_media_results).to be_an Array 
      all_media_results.each do |media|
        expect(media).to be_an_instance_of(MediaResult)
      end
    end

    xit 'will return maximum of 15 results' do 
      
    end
  end
end