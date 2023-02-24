require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  describe 'as a logged in user' do
    let(:user) { {
      id: '1',
      sub: '104505147435508023263',
      name: 'Alex Pitzel',
      username: 'pitzelalex',
      email: 'pitzelalex@gmail.com',
      picture: 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c'
    } }

    it 'displays details about my account' do
      visit dashboard_path

      expect(page).to have_content
    end

    it 'has a button to edit my profile'
  end
end
