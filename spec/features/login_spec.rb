require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe 'when a user' do
    describe 'visits the login path' do
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
      end

      describe 'and they have previously logged in' do
        before(:each) do
          stub_request(:post, 'http://localhost:5000/users')
            .to_return(status: 201,
                       body: File.read('spec/fixtures/alex_login_response.json'),
                       headers: {})
        end

        xit "they're redirected to their dashboard" do
          visit login_path
          expect(page).to have_button 'Continue With Google'

          click_button 'Continue With Google'

          expect(current_path).to eq dashboard_path
          expect(page).to have_content('pitzelalex')
        end
      end

      describe "and it's their first time logging in" do
        before(:each) do
          stub_request(:post, 'http://localhost:5000/users')
            .to_return(status: 201,
                       body: File.read('spec/fixtures/alex_first_login_response.json'),
                       headers: {})
        end

        xit "they're redirected to the onboarding page" do
          visit login_path
          click_button 'Continue With Google'

          expect(current_path).to eq onboarding_path
        end
      end
    end
  end
end
