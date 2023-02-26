require 'rails_helper'

RSpec.describe UserService do
  describe '#login' do
    let(:user_data) do
      { uid: '104505147435508023263',
        full_name: 'Alex Pitzel',
        email: 'pitzelalex@gmail.com',
        first_name: 'Alex',
        last_name: 'Pitzel',
        image: 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }
    end

    it 'can get details about a user from the back end' do
      stub_request(:post, 'http://localhost:5000/api/v1/users')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      response = UserService.login(user_data)

      expect(response[:data][:id]).to eq('1')
      expect(response[:data][:type]).to eq('user')
      expect(response[:data][:attributes][:uid]).to eq('104505147435508023263')
      expect(response[:data][:attributes][:full_name]).to eq('Alex Pitzel')
      expect(response[:data][:attributes][:username]).to eq('pitzelalex')
      expect(response[:data][:attributes][:email]).to eq('pitzelalex@gmail.com')
      expect(response[:data][:attributes][:first_name]).to eq('Alex')
      expect(response[:data][:attributes][:last_name]).to eq('Pitzel')
      expect(response[:data][:attributes][:image]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end

  describe '#onboard' do
    let(:user_data) do
      { 'id' => '1',
        'uid' => '104505147435508023263',
        'full_name' => 'Alex Pitzel',
        'username' => '',
        'email' => 'pitzelalex@gmail.com',
        'first_name' => 'Alex',
        'last_name' => 'Pitzel',
        'image' => 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }
    end

    it 'updates the user entry and gets the details' do stub_request(:patch, 'http://localhost:5000/api/v1/users')
        .to_return(status: 201,
                   body: File.read('spec/fixtures/alex_login_response.json'),
                   headers: {})

      response = UserService.onboard(user_data, 'pitzelalex')

      expect(response[:data][:id]).to eq('1')
      expect(response[:data][:type]).to eq('user')
      expect(response[:data][:attributes][:uid]).to eq('104505147435508023263')
      expect(response[:data][:attributes][:full_name]).to eq('Alex Pitzel')
      expect(response[:data][:attributes][:username]).to eq('pitzelalex')
      expect(response[:data][:attributes][:email]).to eq('pitzelalex@gmail.com')
      expect(response[:data][:attributes][:first_name]).to eq('Alex')
      expect(response[:data][:attributes][:last_name]).to eq('Pitzel')
      expect(response[:data][:attributes][:image]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
    end
  end
end
