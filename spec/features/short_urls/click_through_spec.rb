feature 'Short Url Click through' do
  before do
    @short_url = FactoryGirl.create :short_url, source_url: 'http://google.com'
  end

  context 'when I visit the shortned url' do
    
    before do
      visit click_short_urls_path(@short_url.slug)
    end

    it 'should land on google.com' do
      expect(current_url).to eq 'http://google.com'
    end

    it 'should record a Click for that short url' do
      expect(@short_url.clicks.count).to eq 1
    end

    it 'should record the referrer for that click' do
      expect(@short_url.clicks.first.request['referrer']).to eq 'http://test.com'
    end

  end
end