require 'rails_helper'

RSpec.describe 'The Media Show page', :vcr, type: :feature do
  describe 'it displays media data' do

    before :each do
      visit media_path(3173903)
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

      xit 'shows media genre' do
        expect(page).to have_content 'Genres: '
      end

      it 'shows media poster' do
        within '.poster' do
          expect(page.find('img')[:src]).to eq "https://cdn.watchmode.com/posters/03173903_poster_w185.jpg"
        end
      end

      it 'shows media type' do
        expect(page).to have_content 'Tv'
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

      it 'shows media trailer video' do
        expect(page).to have_css 'iframe'
      end

      xit 'shows what lists this media belongs to for the current user' do
      end
    end
  end
end
