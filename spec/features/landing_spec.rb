require 'rails_helper'

RSpec.describe 'Landing page', type: :feature do

  before :each do 
    stub_request(:get, "http://localhost:5000/api/v1/trending_media")
      .to_return(status: 200, body: File.read('./spec/fixtures/trending_media_response.json'), headers: {})
  end

  describe 'when a user or visitor' do
    describe 'visits the root path, it' do
      it 'should display the app name' do
        visit root_path

        expect(page).to have_content('StreamLined')
      end

      it 'should have a button to Sign in with Google' do
        visit root_path

        expect(page).to have_css '.g_id_signin'
      end

      it "has a 'who are we' section" do 
        visit root_path

        within "#about_us" do
          expect(page).to have_content("Who Are We?")
          expect(page).to have_content("StreamLined is your new go-to media tracking tool ")
        end
      end

      it 'has a section for 3 recommended trending media' do 
        visit root_path
          
        within "#trending_media" do 
          expect(page).to have_content("Trending Now")
          expect(page).to have_content("Die Hart the Movie")
          expect(page).to have_content("We Have a Ghost")
          expect(page).to have_content("Knock at the Cabin")
        end

        within "#media_1077280" do 
          expect(page).to have_content("Die Hart the Movie")
          expect(page).to have_css("img[src='https://image.tmdb.org/t/p/w500/1EnBjTJ5utgT1OXYBZ8YwByRCzP.jpg']")
          expect(page).to have_content("Vote Average: 6.3")
        end
      end
    end
  end
end
