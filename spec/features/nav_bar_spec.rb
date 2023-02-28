require 'rails_helper'

RSpec.describe "The Nav Bar", type: :feature do
  describe 'when the user clicks logout' do
    before :each do
      @user = '1'
    end

    it 'redirects to the landing page and the logout button is no longer displayed', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_call_original
      click_button 'Logout'

      expect(current_path).to eq root_path
      expect(page).to_not have_button 'Logout'
    end

    it 'should have a button to go to My Profile if a user is logged in', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit root_path

      click_button 'My Profile'

      expect(current_path).to eq dashboard_path
    end

    it 'should have a button to go to the home page if you are logged in', :vcr do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path

      click_button 'Home'

      expect(current_path).to eq root_path
    end

    it 'should have a button to go to the home page for a visitor', :vcr do 
      visit search_path

      click_button 'Home'

      expect(current_path).to eq root_path
    end

    it 'should have a home button for both users and visitors', :vcr do 
      visit root_path

      click_button 'Home'

      expect(current_path).to eq root_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit root_path

      click_button 'Home'

      expect(current_path).to eq root_path
    end
  end
end
