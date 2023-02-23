require 'rails_helper'

RSpec.describe UserFacade do
  describe '#login' do
    it 'can return a hash of user details' do
      stub_request(:post, 'http://localhost:5000/users')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      user_data = { uid: '104505147435508023263',
                    full_name: 'Alex Pitzel',
                    email: 'pitzelalex@gmail.com',
                    first_name: 'Alex',
                    last_name: 'Pitzel',
                    image: 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }

      user = UserFacade.login(user_data)

      expect(user).to be_a Hash
      expect(user[:id]).to eq('1')
      expect(user[:google_id]).to eq('104505147435508023263')
      expect(user[:full_name]).to eq('Alex Pitzel')
      expect(user[:user_name]).to eq('pitzelalex')
      expect(user[:email]).to eq('pitzelalex@gmail.com')
      expect(user[:first_name]).to eq('Alex')
      expect(user[:last_name]).to eq('Pitzel')
      expect(user[:image]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end

  describe '#onboard' do
    it 'can return a hash of user details' do
      stub_request(:patch, 'http://localhost:5000/users')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      current_user = { 'id' => '1',
                       'google_id' => '104505147435508023263',
                       'full_name' => 'Alex Pitzel',
                       'user_name' => '',
                       'email' => 'pitzelalex@gmail.com',
                       'first_name' => 'Alex',
                       'last_name' => 'Pitzel',
                       'image' => 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }

      user = UserFacade.onboard(current_user, 'pitzelalex')

      expect(user).to be_a Hash
      expect(user[:id]).to eq('1')
      expect(user[:google_id]).to eq('104505147435508023263')
      expect(user[:full_name]).to eq('Alex Pitzel')
      expect(user[:user_name]).to eq('pitzelalex')
      expect(user[:email]).to eq('pitzelalex@gmail.com')
      expect(user[:first_name]).to eq('Alex')
      expect(user[:last_name]).to eq('Pitzel')
      expect(user[:image]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end
end
