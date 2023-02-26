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

      expect(user).to be_a Hash
      expect(user[:id]).to eq('1')
      expect(user[:sub]).to eq('104505147435508023263')
      expect(user[:name]).to eq('Alex Pitzel')
      expect(user[:username]).to eq('pitzelalex')
      expect(user[:email]).to eq('pitzelalex@gmail.com')
      expect(user[:picture]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end

  describe '#edit_user' do
    it 'can return a hash of user details' do
      stub_request(:patch, 'http://localhost:5000/api/v1/users/1')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      current_user = { 'id' => '1',
                       'sub' => '104505147435508023263',
                       'name' => 'Alex Pitzel',
                       'username' => '',
                       'email' => 'pitzelalex@gmail.com',
                       'picture' => 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }

      user = UserFacade.edit_user(current_user, 'pitzelalex')

      expect(user).to be_a Hash
      expect(user[:id]).to eq('1')
      expect(user[:sub]).to eq('104505147435508023263')
      expect(user[:name]).to eq('Alex Pitzel')
      expect(user[:username]).to eq('pitzelalex')
      expect(user[:email]).to eq('pitzelalex@gmail.com')
      expect(user[:picture]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end

  describe '#edit_user' do
    it 'can return a hash of user details' do
      stub_request(:patch, 'http://localhost:5000/api/v1/users/1')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      current_user = { 'id' => '1',
                       'sub' => '104505147435508023263',
                       'name' => 'Alex Pitzel',
                       'username' => '',
                       'email' => 'pitzelalex@gmail.com',
                       'picture' => 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }

      user = UserFacade.edit_user(current_user, 'pitzelalex')

      expect(user).to be_a Hash
      expect(user[:id]).to eq('1')
      expect(user[:sub]).to eq('104505147435508023263')
      expect(user[:name]).to eq('Alex Pitzel')
      expect(user[:username]).to eq('pitzelalex')
      expect(user[:email]).to eq('pitzelalex@gmail.com')
      expect(user[:picture]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end
end
