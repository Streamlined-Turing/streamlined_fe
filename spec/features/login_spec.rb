require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe 'when a user' do
    describe 'visits the login path, it' do
      it 'should display the app name' do
        expect(page).to have_button 'Continue With Google'
      end
    end
  end
end
