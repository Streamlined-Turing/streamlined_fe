require 'rails_helper'

RSpec.describe UserService, :vcr do
  let(:user_data) do
    { sub: '104505147435508023263',
      name: 'Alex Pitzel',
      email: 'pitzelalex@gmail.com',
      picture: 'https://lh3.googleusercontent.com/a/AGNmyxZxvaMaqWjnwCfSs2_g9yETZREpYAM5GPNneX2pbw=s96-c' }
  end
  describe '#login' do

    it 'can get details about a user from the back end' do
      response = UserService.login(user_data)

      expect(response[:data][:id]).to eq('1')
      expect(response[:data][:type]).to eq('user')
      expect(response[:data][:attributes][:sub]).to eq('104505147435508023263')
      expect(response[:data][:attributes][:name]).to eq('Alex Pitzel')
      expect(response[:data][:attributes][:username]).to eq('pitzelalex')
      expect(response[:data][:attributes][:email]).to eq('pitzelalex@gmail.com')
      expect(response[:data][:attributes][:picture]).to eq('https://lh3.googleusercontent.com/a/AGNmyxZxvaMaqWjnwCfSs2_g9yETZREpYAM5GPNneX2pbw=s96-c')
    end
  end

  describe '#edit_user' do
    let(:user_id) { '1' }

    it 'updates the user entry and gets the details' do
      response = UserService.edit_user(user_id, 'pitzelalex')

      expect(response[:data][:id]).to eq('1')
      expect(response[:data][:type]).to eq('user')
      expect(response[:data][:attributes][:sub]).to eq('104505147435508023263')
      expect(response[:data][:attributes][:name]).to eq('Alex Pitzel')
      expect(response[:data][:attributes][:username]).to eq('pitzelalex')
      expect(response[:data][:attributes][:email]).to eq('pitzelalex@gmail.com')
      expect(response[:data][:attributes][:picture]).to eq('https://lh3.googleusercontent.com/a/AGNmyxZxvaMaqWjnwCfSs2_g9yETZREpYAM5GPNneX2pbw=s96-c')
    end
  end

  describe '#get' do
    let(:user_id) { '1' }

    it "gets a user's details" do
      response = UserService.get(user_id)

      expect(response[:data][:id]).to eq('1')
      expect(response[:data][:type]).to eq('user')
      expect(response[:data][:attributes][:sub]).to eq('104505147435508023263')
      expect(response[:data][:attributes][:name]).to eq('Alex Pitzel')
      expect(response[:data][:attributes][:username]).to eq('pitzelalex')
      expect(response[:data][:attributes][:email]).to eq('pitzelalex@gmail.com')
      expect(response[:data][:attributes][:picture]).to eq('https://lh3.googleusercontent.com/a/AGNmyxZxvaMaqWjnwCfSs2_g9yETZREpYAM5GPNneX2pbw=s96-c')
    end
  end

  describe '#delete' do
    let(:user_id) { '3' }

    it 'deletes the user and returns a status of 204' do
      login_response = UserService.login(user_data)
      response = UserService.delete(user_id)

      expect(response.status).to eq(204)
    end

    it 'returns a 404 if user id does not exist' do
      response = UserService.delete('100')

      expect(response.status).to eq(404)
    end
  end
end
