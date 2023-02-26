require 'rails_helper'

RSpec.describe 'The Media Show page', type: :feature do
  describe 'it displays media data' do
    let!(:url) { "localhost:5000/api/v1/media/1" }
    let!(:response) { File.read("./spec/fixtures/media1.json") }

    before :each do
      stub_request(:get, url).to_return(status: 200, body: response)
      visit media_path(1)
    end

    describe 'media attributes' do

      it 'shows media title' do
        expect(page).to have_content 'Breaking Bad'
      end

      it 'shows media description' do
        expect(page).to have_content "When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime."
      end

      it 'shows media rating' do
        expect(page).to have_content 9.3 
      end

      it 'shows media genre' do
        expect(page).to have_content 'Action'
      end

      it 'shows media poster' do
        expect(page.find('img')[:src]).to eq "https://cdn.watchmode.com/posters/03173903_poster_w185.jpg"
      end

      it 'shows media type' do
        expect(page).to have_content 'tv_series'
      end

      it 'shows media release year' do
        expect(page).to have_content '2008'
      end

      it 'shows media language' do
        expect(page).to have_content 'en'
      end

      it 'shows media streaming services' do
        expect(page).to have_content 'Netflix'
      end
    end
  end
end
