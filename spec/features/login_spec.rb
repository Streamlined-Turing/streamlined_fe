require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe 'when a user' do
    describe 'visits the login path, it' do
      before(:each) do
        OmniAuth.config.test_mode = true
      end

      it 'redirect to landing and have session id' do
        stub_request(:post, 'http://localhost:5000/users')
          .to_return(status: 201,
                     body: File.read('spec/fixtures/alex_login_response.json'),
                     headers: {})

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

        visit login_path
        expect(page).to have_button 'Continue With Google'

        click_button 'Continue With Google'

        expect(current_path).to eq root_path
        expect(page).to have_content('User ID: 1')
      end
    end
  end
end
