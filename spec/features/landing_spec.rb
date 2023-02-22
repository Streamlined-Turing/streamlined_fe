require 'rails_helper'

RSpec.describe 'Landing page', type: :feature do
  describe 'when a user' do
    describe 'visits the root path, it' do
      it 'should display the app name' do
        visit root_path

        expect(page).to have_content('Streamlined')
      end

      it 'should have a button to login' do
        visit root_path

        expect(page).to have_button 'Login'

        click_button 'Login'

        expect(current_path).to eq(login_path)
      end
    end
  end
end
