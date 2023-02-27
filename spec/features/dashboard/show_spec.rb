require 'rails_helper'

RSpec.describe 'user dashboard', type: :feature do
  describe 'as a logged in user' do
    let(:user) do
      {
        'id' => '1',
        'sub' => '104505147435508023263',
        'name' => 'Alex Pitzel',
        'username' => 'pitzelalex',
        'email' => 'pitzelalex@gmail.com',
        'picture' => 'https://lh3.googleusercontent.com/a/AGNmyxZxvaMaqWjnwCfSs2_g9yETZREpYAM5GPNneX2pbw=s96-c'
      }
    end

    it 'displays details about my account', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user['id'])

      visit dashboard_path

      expect(page).to have_content(user['username'])
      expect(page).to have_content(user['email'])
      expect(page).to have_content(user['name'])
      expect(page.find('img')[:src]).to eq user['picture']
    end

    it 'has a button to edit my profile', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user['id'])

      visit dashboard_path

      expect(page).to have_button('Edit Profile')

      click_button 'Edit Profile'

      expect(current_path).to eq dashboard_edit_path
    end
  end
end
