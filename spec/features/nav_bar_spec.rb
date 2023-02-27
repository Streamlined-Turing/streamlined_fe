require 'rails_helper'

RSpec.describe 'The logout feature', type: :feature do
  describe 'when the user clicks logout' do
    before :each do
      @user = { id: 1, username: 'test' }

      stub_request(:get, "http://localhost:5000/api/v1/trending_media")
        .to_return(status: 200, body: File.read('./spec/fixtures/trending_media_response.json'), headers: {})
    end

    it 'redirects to the landing page and the logout button is no longer displayed' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_call_original
      click_button 'Logout'

      expect(current_path).to eq root_path
      expect(page).to_not have_button 'Logout'
    end

    it 'should have a button to go to My Profile if a user is logged in' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit root_path

      click_button 'My Profile'

      expect(current_path).to eq dashboard_path
    end
  end
end
