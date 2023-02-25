require 'rails_helper'

RSpec.describe 'Media Search' do 

  before :each do 
    stub_request(:get, "https://localhost:5000/api/v1/search?q=hello")
      .to_return(status: 200, body: File.read('./spec/fixtures/search_movies_response.json'), headers: {})
  end

  describe 'when a user or visitor visits any page' do 
    it 'has a text field to enter keyword(s) to search by a media title' do 
      visit root_path

      fill_in "query", with: "hello"
      click_button "Search"

      expect(current_path).to eq search_path
      expect(page).to have_content('Results For: hello')
      expect(page).to have_content('Hello Debate Opponent')
      expect(page).to have_content('Hello Tomorrow!')
      expect(page).to have_content('Hello, My Name Is Doris')
    end
  end

  xit 'has a maximum of 15 results' do 
    visit root_path

    fill_in "query", with: "hello"
    click_button "Search"

    expect(current_path).to eq search_path
    expect(page).to have_css('.media', count: 15)

    visit root_path

    fill_in "query", with: "hel"
    click_button "Search"

    expect(current_path).to eq search_path
    expect(page).to have_css('.media', count: 15)
  end

  xit 'has posters for each media result' do 

  end

  xit 'has a link to each media show page' do 

  end

  # xit 'displays the media type' do 

  # end
  
  # xit 'test case insensative ?? '

end