require 'rails_helper'

RSpec.describe 'Media Search' do 

  before :each do 
    stub_request(:get, "http://localhost:5000/api/v1/media?q=bad")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_media_response.json'), headers: {})
  end

  describe 'when a user or visitor visits any page' do 
    it 'has a text field to enter keyword(s) to do a case-insensative search by a media title' do 
      visit root_path

      fill_in "query", with: "bad"
      click_button "Search"

      expect(current_path).to eq search_path
      
      expect(page).to have_content('Results For: bad')

      within "#media_1588222" do 
        expect(page).to have_content('The Bad Guys')
        expect(page).to have_css("img[src='https://cdn.watchmode.com/posters/01588222_poster_w185.jpg']")
        expect(page).to have_content('Media Type: Movie')
        expect(page).to have_content('Release Year: 2022')
      end 

      within "#media_311191" do 
        expect(page).to have_content('Bad Education')
        expect(page).to have_css("img[src='https://cdn.watchmode.com/posters/0311191_poster_w185.jpg']")
        expect(page).to have_content('Media Type: Tv Series')
        expect(page).to have_content('Release Year: 2012')
      end 
    end

    it 'has a link to each media show page' do 
      visit root_path

      fill_in "query", with: "bad"
      click_button "Search"

      expect(current_path).to eq search_path
      
      within "#media_1588222" do 
        expect(page).to have_link('The Bad Guys')
        # click_link 'Breaking Bad'
        # expect(current_path).to eq 
      end
    end
  end 
end