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

      fill_in 'username', with: 'pitzelalex'

      click_button 'Save'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content('pitzelalex')
    end
  end
end
