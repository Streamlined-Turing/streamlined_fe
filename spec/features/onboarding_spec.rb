require 'rails_helper'

RSpec.describe 'Onboarding Page', type: :feature do
  describe 'when a user has logged in for the first time' do
    before(:each) do
      user = '1'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'they see a prompt to provide a user name', :vcr do
      visit onboarding_path

      expect(page).to have_content('Welcome to Streamlined')
      expect(page).to have_content('Please enter a username')
      expect(page).to have_field 'username'

      fill_in 'username', with: 'kerynn'

      click_button 'Save'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content('kerynn')
    end
  end

  describe 'as a visitor' do 
    it 'cannot access the onboarding page', :vcr do
      stub_request(:get, "http://localhost:5000/api/v1/trending_media")
        .to_return(status: 200, body: File.read('./spec/fixtures/trending_media_response.json'), headers: {})

      visit onboarding_path

      expect(current_path).to eq root_path
      expect(page).to have_content("Must be logged in to access the onboarding page")
    end
  end
end
