feature 'Short Urls Create' do
  
  context 'When I visit the new short urls page' do
    before do
      visit new_short_url_path
    end

    context 'and click create' do
      
      before do
        click_on 'Shorten this url'
      end

      it 'should give me a validation message' do
        expect(page).to have_content('Hey, you need to provide a url to shorten!')
      end

      it 'should not create a new short url' do
        expect(ShortUrl.count).to eq 0
      end
    end

    context 'and fill in the form and click create' do

      before do
        fill_in :short_url_source_url, with: 'http://google.com'
        click_on 'Shorten this url'

        @short_url = ShortUrl.first
      end

      it 'should show me the details page for the shortened url' do
        expect(current_path).to eq short_url_path(@short_url)
      end

      it 'should create a new short url' do
        expect(@short_url).to_no be_nil
      end

      it 'should store the source and shortend url' do
        expect(@short_url.source_url).to eq 'http://google.com'
        expect(@short_url.value).to be_present
      end

      it 'should include the base url in the shortened url' do
        expect(@short_url.value).to inlcude('http://shorty.herokuapp.com')
        expect(@short_url.value.length).to be > 'http://shorty.herokuapp.com'.length
      end

    end

  end
end