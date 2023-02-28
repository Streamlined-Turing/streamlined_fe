require 'rails_helper'

RSpec.describe 'footer content' do
  it 'displays TMDB and watchmode logos with attribution', :vcr do
    visit root_path
    within ".tmdb-logo" do
      expect(page.find('img')[:src]).to eq('/assets/attribution/tmdb_logo-d96058e1921975014877e3200ded5108d6a3684ff478ea7bd7b8a5154095e410.png')
    end

    within ".wm-logo" do
      expect(page.find('img')[:src]).to eq('/assets/attribution/watchmode-small-logo-23e669c21e47a53b94e44d2b9c9d83ce7d18da81d699ca3c515e4c7f86dfc166.png')
    end

    expect(page).to have_content('This website uses the TMDB API and streaming data is powered by Watchmode.com.')
    expect(page).to have_content('This website is not endorsed or certified by TMDB or Watchmode.com.')
  end
end