require 'rails_helper'

RSpec.describe 'Media Search' do 
  describe 'when a user or visitor visits any page' do 
    it 'has a text field to enter keyword(s) to search by a media title' do 
      visit root_path

      fill_in "Search for Media:", with: ""
      click_button "Search"

      expect(current_path).to eq search_path
    end
  end
end