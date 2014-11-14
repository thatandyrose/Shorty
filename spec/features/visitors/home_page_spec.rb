# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  context 'When I visit the home page' do
    before do
      visit root_path
    end
    
    it 'should show me the hello message' do
      expect(page).to have_content "What's up Shorty"
    end

    it 'should show links to create a new short url' do
      expect(page).to have_selector "a[href='#{new_short_url_path}']"
    end

    it 'should show links to view shortened urls' do
      expect(page).to have_selector "a[href='#{short_urls_path}']"
    end
    
  end

end
