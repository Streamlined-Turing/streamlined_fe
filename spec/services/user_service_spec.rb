require 'rails_helper'

RSpec.describe UserService do
  let(:user_data) do
    { uid: '104505147435508023263',
      full_name: 'Alex Pitzel',
      email: 'pitzelalex@gmail.com',
      first_name: 'Alex',
      last_name: 'Pitzel',
      image: 'https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c' }
  end

  it 'can get details about a user from the back end' do
    stub_request(:post, 'http://localhost:5000/users')
      .to_return(status: 201,
                 body: File.read('spec/fixtures/alex_login_response.json'),
                 headers: {})

    response = UserService.login(user_data)

    expect(response[:data][:id]).to eq('1')
    expect(response[:data][:type]).to eq('user')
    expect(response[:data][:attributes][:uid]).to eq('104505147435508023263')
    expect(response[:data][:attributes][:full_name]).to eq('Alex Pitzel')
    expect(response[:data][:attributes][:user_name]).to eq('pitzelalex')
    expect(response[:data][:attributes][:email]).to eq('pitzelalex@gmail.com')
    expect(response[:data][:attributes][:first_name]).to eq('Alex')
    expect(response[:data][:attributes][:last_name]).to eq('Pitzel')
    expect(response[:data][:attributes][:image]).to eq('https://lh3.googleusercontent.com/a/AEdFTp5vj_rzxJzWHjgqM1-InqDI0fJWxwpHK_zElpKLgA=s96-c')
  end
end
