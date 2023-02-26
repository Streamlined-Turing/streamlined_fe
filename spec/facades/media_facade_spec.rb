require 'rails_helper'

RSpec.describe MediaFacade do
  describe 'instance methods' do
    describe '#media' do
      it 'can return a single media object' do
        response = File.read("./spec/fixtures/media1.json")
        stub_request(:get, "localhost:5000/api/v1/media/1").to_return(status: 200, body: response)
        expect(MediaFacade.media(1)).to be_a Media 
      end
    end
  end
end
