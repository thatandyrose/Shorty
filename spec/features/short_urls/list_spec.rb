feature 'Short Url List' do

  context 'When I visit the Short Url index page' do
    
    context 'and there are no urls' do

      before do
        visit short_urls_path
      end
      
      it 'should show me a message' do
        expect(page).to have_content "Hey, there are no urls yet, why don't you create one?"
      end

      it 'should have a link to create a new url' do
        expect(page).to have_selector "a[href='#{new_short_url_path}']"
      end

    end

    context 'and there is a url' do

      before do
        @short_url = FactoryGirl.create :short_url, :with_clicks, source_url: 'http://google.com'
        visit short_urls_path
      end

      it 'should show me the source url' do
        expect(page).to have_content 'http://google.com'
      end

      it 'should show me the value url' do
        expect(page).to have_content 'http://shorty.herokuapp.com'
        expect(page).to have_content @short_url.value
      end

      it 'should have a link to see the short url details' do
        expect(page).to have_selector "a[href='#{short_url_path(@short_url)}']"
      end

      it 'should show me the click count' do
        expect(page).to have_content "20 clicks"
      end


    end

  end
end