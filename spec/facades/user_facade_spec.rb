require 'rails_helper'

RSpec.describe UserFacade do
  describe '#login' do
    it 'can return a collection of cast objects' do
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

      expect(user).to be_a String
      expect(user).to eq('1')
    end
  end
end
