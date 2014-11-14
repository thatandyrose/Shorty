feature 'Short Url Show' do

  before do
    @short_url = FactoryGirl.create :short_url, :with_clicks, source_url: 'http://google.com'
  end
  
  context 'When I visit the show short url page' do
    
    before do
      visit short_url_path(@short_url)
    end

    it 'should show me the source url' do
      expect(page).to have_content 'http://google.com'
    end

    it 'should show me the click count' do
      expect(page).to have_content '20 clicks'
    end

    it 'should show me when the last click was' do
      expect(page).to have_content "The last click was 1 day ago"
    end

    it 'should show me the click referrer for the last click' do
      expect(page).to have_content "The last click referrer was http://test.com"
    end

    it 'should have the actual shortend url for me to click' do
      expect(page).to have_selector "a[href='#{@short_url.value}']"
    end

  end

end