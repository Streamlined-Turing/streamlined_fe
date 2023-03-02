require 'rails_helper'

RSpec.describe 'footer content' do
  it 'displays TMDB and watchmode logos with attribution', :vcr do
    visit root_path
    
    within ".tmdb-logo" do
      expect(page.find('img')[:src]).to eq('/assets/attribution/tmdb-logo-long-7cf604159ebb70df0b37aaf0cca032004ab1c70137645a12fc70755760c9f8c0.png')
    end

    within ".wm-logo" do
      expect(page.find('img')[:src]).to eq('/assets/attribution/watchmode_logo-ac77c09d8ff3a88973f4576454b6a0404c106ddc850da512f9029991d34453bb.png')
    end

    expect(page).to have_content('This website uses the TMDB API and streaming data is powered by Watchmode.com.')
    expect(page).to have_content('This website is not endorsed or certified by TMDB or Watchmode.com.')
  end
end