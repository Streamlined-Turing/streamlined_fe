require 'rails_helper'

RSpec.describe Media do
  before :each do 
    @media = Media.new(JSON.parse(File.read('./spec/fixtures/media1.json'), symbolize_names: true)[:data])
  end 

  it 'exists and has readable attributes' do 
    expect(@media.id).to eq @media.id
    expect(@media.title).to eq @media.title
    expect(@media.poster).to eq @media.poster
    expect(@media.description).to eq @media.description
    expect(@media.genres).to eq @media.genres
    expect(@media.runtime).to eq @media.runtime
    expect(@media.type).to eq @media.type
    expect(@media.release_year).to eq @media.release_year
    expect(@media.rating).to eq @media.rating
    expect(@media.trailer).to eq @media.trailer
    expect(@media.language).to eq @media.language
    expect(@media.sub_services).to eq @media.sub_services
    expect(@media.audience_score).to eq @media.audience_score
    expect(@media.vote_average).to eq @media.vote_average
    expect(@media.user_lists).to eq @media.user_lists
  end

  it 'can reformat the media type' do 
    expect(@media.formatted_type).to eq('Tv Series')
  end

  it 'can round the vote average' do     
    expect(@media.round_vote).to eq(6.3)
  end

  it 'can reformat the genres' do 
    expect(@media.genres).to eq('Action')
  end

  it 'can reformat the sub_services' do 
    expect(@media.sub_services).to eq('Netflix')
  end
end
