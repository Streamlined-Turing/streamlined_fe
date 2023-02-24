require 'rails_helper'

RSpec.describe 'The Media Show page', type: :feature do
  describe 'it displays media data' do
    let!(:media1) { build(:media) }

    before :each do
      visit media_path(media1)
    end

    it 'shows media title' do
      expect(page).to have_content media1.title
    end
  end
end
