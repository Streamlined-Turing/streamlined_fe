require 'rails_helper'

RSpec.describe 'Landing page', type: :feature do
  describe 'when a user' do
    describe 'visits the root path, it' do
      it 'should display the app name' do
        visit root_path

        expect(page).to have_content('StreamLined')
      end

      it 'should have a button to Sign in with Google' do
        visit root_path

        expect(page).to have_css '.g_id_signin'
      end
    end
  end
end
