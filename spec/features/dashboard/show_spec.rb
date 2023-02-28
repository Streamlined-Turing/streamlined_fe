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
      within '.profile_pic' do
        expect(page.find('img')[:src]).to eq user['picture']
      end
    end

    it 'has a button to edit my profile', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user['id'])

      visit dashboard_path

      expect(page).to have_button('Edit Profile')

      click_button 'Edit Profile'

      expect(current_path).to eq edit_dashboard_path
    end
  end

  describe 'as a visitor' do 
    it 'does not allow access to the dashboard', :vcr do 
      stub_request(:get, "http://localhost:5000/api/v1/trending_media")
      .to_return(status: 200, body: File.read('./spec/fixtures/trending_media_response.json'), headers: {})

      visit dashboard_path

      expect(current_path).to eq root_path
      expect(page).to have_content("Must be logged in to access the dashboard")
    end
  end
end
