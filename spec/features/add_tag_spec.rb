feature 'Add tag' do
  scenario 'Add a tag when adding a url' do
    visit '/links'
    click_link 'new_link'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    fill_in 'tag', with: 'News'
    click_button('submit')
    within('ul#links') do
      expect(page).to have_content('Tag: News')
    end
  end
end
