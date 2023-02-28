require 'rails_helper'

RSpec.describe UserFacade do
  describe '#login' do
    it 'can return a hash of user details' do
      stub_request(:post, 'http://localhost:5000/api/v1/users')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      user_data = { sub: '104505147435508023263',
                    name: 'Alex Pitzel',
                    email: 'pitzelalex@gmail.com',
                    picture: 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }

      user = UserFacade.login(user_data)

      expect(user).to be_a User
    end
  end

  describe '#edit_user' do
    it 'can return a hash of user details' do
      stub_request(:patch, 'http://localhost:5000/api/v1/users/1')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      user_id = '1'

      user = UserFacade.edit_user(user_id, 'pitzelalex')

      expect(user).to be_a User
    end
  end

  describe '#delete' do
    it 'deletes the user', :vcr do
      user_data = { sub: '104505147435508023263',
        name: 'Alex Pitzel',
        email: 'pitzelalex@gmail.com',
        picture: 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }

      user = UserFacade.login(user_data)

      response = UserFacade.delete('6')

      expect(response.status).to eq(204)
    end
  end
end
