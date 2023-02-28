require 'rails_helper'

RSpec.describe 'user dashboard edit', type: :feature do
  describe 'as a logged in user' do
    let(:user_id) { '1' }

    it 'has a field to edit username', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_id)

      visit dashboard_edit_path

      expect(page).to have_field('username', with: 'pitzelalex')
      expect(page).to have_button 'Update Username'

      fill_in 'username', with: 'new_username'

      click_button 'Update Username'

      expect(current_path).to eq dashboard_path

      expect(page).to have_content('Username: new_username')
    end

    it 'has a button to delete account', :vcr do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_id)

      visit dashboard_edit_path
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_call_original

      click_button('Delete Account')

      expect(current_path).to eq(root_path)
      expect(page).to have_css '.g_id_signin'
      expect(page).to have_content('Account successfully deleted')
    end
  end
end
