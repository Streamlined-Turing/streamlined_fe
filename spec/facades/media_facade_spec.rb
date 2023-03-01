require 'rails_helper'

RSpec.describe MediaFacade, :vcr do
  describe 'instance methods' do
    describe '#media' do
      it 'can return a single media object' do
        expect(MediaFacade.media(3173903)).to be_a Media 
      end
    end
  end

  describe '.search_results' do 
    it 'can return a collection of a maximum of 15 media result objects' do 

      all_media_results = MediaFacade.search_results('bad')

      expect(all_media_results).to be_an Array 
      expect(all_media_results.count).to be <= 15
      
      all_media_results.each do |media|
        expect(media).to be_an_instance_of(Media)
      end
    end
  end

  describe '.trending_media' do 
    it 'can return a collection of trending media result objects' do 

      trending_media_results = MediaFacade.trending_media 

      expect(trending_media_results).to be_an Array 
      
      trending_media_results.each do |media|
        expect(media).to be_an_instance_of(Media)
      end
    end
  end
end
