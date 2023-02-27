require 'rails_helper'

RSpec.describe Media do
  it 'exists and has readable attributes' do
    media = Media.new(JSON.parse(File.read('./spec/fixtures/media1.json'), symbolize_names: true)[:data])
    
    expect(media.id).to eq media.id
    expect(media.title).to eq media.title
    expect(media.poster).to eq media.poster
    expect(media.description).to eq media.description
    expect(media.genres).to eq media.genres
    expect(media.runtime).to eq media.runtime
    expect(media.type).to eq media.type
    expect(media.release_year).to eq media.release_year
    expect(media.rating).to eq media.rating
    expect(media.trailer).to eq media.trailer
    expect(media.language).to eq media.language
    expect(media.sub_services).to eq media.sub_services
    expect(media.audience_score).to eq media.audience_score
  end
end
