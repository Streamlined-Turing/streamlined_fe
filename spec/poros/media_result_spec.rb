require 'rails_helper'

RSpec.describe MediaResult do 
  it 'exists and has attributes' do 
    media_data = {
      "id": "3173903",
      "type": "media",
      "attributes": {
              "id": 3173903,
              "title": "Breaking Bad",
              "audience_score": 9.3,
              "rating": "TV-MA",
              "type": "tv_series",
              "description": " Walter White goes bonkers",
              "genres": [],
              "release_year": 2008,
              "runtime": 45,
              "language": "en",
              "sub_services": ["Netflix"],
              "poster": "https://cdn.watchmode.com/posters/03173903_poster_w185.jpg"}
      }

      media = MediaResult.new(media_data)

      expect(media).to be_an_instance_of(MediaResult)
      expect(media.id).to eq(3173903)
      expect(media.title).to eq("Breaking Bad")
      expect(media.type).to eq("tv_series")
      expect(media.audience_score).to eq(9.3)
      expect(media.poster).to eq("https://cdn.watchmode.com/posters/03173903_poster_w185.jpg")
  end
end