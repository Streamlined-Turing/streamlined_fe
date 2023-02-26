require 'rails_helper'

RSpec.describe 'user dashboard edit', type: :feature do
  describe 'as a logged in user' do
    let(:user) do
      {
        'id' => '1',
        'sub' => '104505147435508023263',
        'name' => 'Alex Pitzel',
        'username' => 'pitzelalex',
        'email' => 'pitzelalex@gmail.com',
        'picture' => 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c'
      }
    end

    let(:new_user) do
      {
        'id' => '1',
        'sub' => '104505147435508023263',
        'name' => 'Alex Pitzel',
        'username' => 'new_username',
        'email' => 'pitzelalex@gmail.com',
        'picture' => 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c'
      }
    end

    it 'has a field to edit username', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_edit_path

      expect(page).to have_field('username', with: 'pitzelalex')
      expect(page).to have_button 'Update Username'

      fill_in 'username', with: 'new_username'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(new_user)

      click_button 'Update Username'

      expect(current_path).to eq dashboard_path

      expect(page).to have_content('Username: new_username')
    end

    it 'has a button to delete account'
  end
end
