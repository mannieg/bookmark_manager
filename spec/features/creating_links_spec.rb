feature 'Creating New Links' do
  scenario 'User can create new links with title and URL' do
    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    click_button 'Add Link'
    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end
