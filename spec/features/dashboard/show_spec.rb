require 'rails_helper'

RSpec.describe 'user dashboard', type: :feature do
  describe 'as a logged in user' do
    let(:user) do
      {
        'id' => '1',
        'sub' => '105041345352080471447',
        'name' => 'Kerynn Davis',
        'username' => 'kerynn',
        'email' => 'kerynn.davis@gmail.com',
        'picture' => 'https://lh3.googleusercontent.com/a/AGNmyxY5UK6Lt_U-V4uA3JuRjjmNBwUxk3usxmjmO3wP=s96-c'
      }
    end

    before :each do 
      stub_request(:get, "http://localhost:5000/api/v1/users/1/lists?list=Currently Watching}")
        .to_return(status: 200, body: File.read('./spec/fixtures/user_media_list_response.json'), headers: {})
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

    it 'has a section for currently watching' do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user['id'])

      visit dashboard_path

      within '#currently_watching' do 
        expect(page).to have_content('Currently Watching')
        expect(page).to_not have_link('Currently Watching')
        # expect(page).to have_content('Game of Thrones')
        # expect(page).to have_content('The Lego Batman Movie')
      end 
    end

    it 'has a section for want to watch' do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user['id'])

      visit dashboard_path
      
      within '#currently_watching' do
        expect(page).to have_link('Watched')
        click_link 'Want to Watch'
      end 

      within '#want_to_watch' do 
        expect(page).to have_content('Want to Watch')
        expect(page).to_not have_link('Want to Watch')
        expect(page).to have_content('This list is currently empty. Search for media to start adding!')
      end 
    end

    it 'has a section for watched' do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user['id'])

      visit dashboard_path
      
      within '#currently_watching' do 
        click_link 'Watched'
      end 

      within '#watched' do 
        expect(page).to have_content('Watched')
        expect(page).to_not have_link('Watched')
      end 
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
