require 'rails_helper'

RSpec.describe 'Media Search' do 

  before :each do 
    stub_request(:get, "http://localhost:5000/api/v1/search?q=bad")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movies_response.json'), headers: {})
  end

  describe 'when a user or visitor visits any page' do 
    it 'has a text field to enter keyword(s) to do a case-insensative search by a media title' do 
      visit root_path

      fill_in "query", with: "bad"
      click_button "Search"

      expect(current_path).to eq search_path
      
      expect(page).to have_content('Results For: bad')

      within "#media_3173903" do 
        expect(page).to have_content('Breaking Bad')
        expect(page).to have_css("img[src='https://cdn.watchmode.com/posters/03173903_poster_w185.jpg']")
        expect(page).to have_content('Media Type: Tv Series')
        expect(page).to have_content('Audience Score: 9.3')
      end 

      within "#media_456789" do 
        expect(page).to have_content('Bad Times')
        expect(page).to have_css("img[src='https://cdn.watchmode.com/posters/03168281_poster_w185.jpg']")
        expect(page).to have_content('Media Type: Movie')
        expect(page).to have_content('Audience Score: 8')
      end 
    end
  end

  xit 'has a maximum of 15 results' do 
    visit root_path

    fill_in "query", with: "bad"
    click_button "Search"

    expect(current_path).to eq search_path
    expect(page).to have_css('div.media', maximum: 15)

    visit root_path

    fill_in "query", with: "ba"
    click_button "Search"

    expect(current_path).to eq search_path
    expect(page).to have_css('div.media', maximum: 15)
  end

  xit 'has a link to each media show page' do 

  end
  
  # xit 'test case insensative ?? '

end