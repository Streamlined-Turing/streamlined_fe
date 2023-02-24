require 'rails_helper'

RSpec.describe 'Onboarding Page', type: :feature do
  before(:each) do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      { 'provider' => 'google_oauth2',
        'uid' => '104505147435508023263',
        'info' =>
      { 'name' => 'Alex Pitzel',
        'email' => 'pitzelalex@gmail.com',
        'unverified_email' => 'pitzelalex@gmail.com',
        'email_verified' => true,
        'first_name' => 'Alex',
        'last_name' => 'Pitzel',
        'image' => 'https://lh3.googleusercontent.com/a/AGNmyxZxvaMaqWjnwCfSs2_g9yETZREpYAM5GPNneX2pbw=s96-c' } }
    )

    stub_request(:post, 'http://localhost:5000/users')
            .to_return(status: 201,
                       body: File.read('spec/fixtures/alex_first_login_response.json'),
                       headers: {})

    stub_request(:patch, 'http://localhost:5000/users')
            .to_return(status: 201,
                       body: File.read('spec/fixtures/alex_login_response.json'),
                       headers: {})
  end

  describe 'when a user has logged in for the first time' do
    xit 'they see a prompt to provide a user name' do
      visit login_path
      click_button 'Continue With Google'

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
