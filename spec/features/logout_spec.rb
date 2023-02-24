require 'rails_helper'

RSpec.describe "The logout feature", type: :feature do
  describe 'when the user clicks logout' do
    before :each do
      @user = {id: 1, username: 'test'}
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'redirects to the landing page and the logout button is no longer displayed' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_call_original
      click_button 'Logout'

      expect(current_path).to eq root_path
      expect(page).to_not have_button "Logout"
    end
  end
end
