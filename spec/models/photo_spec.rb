require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:photo) { create(:photo) }
  let(:photo_copy) { create(:photo) }

  describe '#similar' do
    xit 'returns similar photos' do
      expect(photo.similar).to eq([photo_copy])
    end
  end

  describe '.by_description' do
    xit 'returns photos by description' do
      expect(Photo.by_description('a photo')).to match_array([photo, photo_copy])
    end
  end
end
