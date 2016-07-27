feature 'Filter by tags' do

  before(:each) do
    Link.create(url: 'www.bubble.com', title: 'Bubble', tags: [Tag.first_or_create(tag: 'bubbles')])
    Link.create(url: 'www.bbc.com', title: 'BBC', tags: [Tag.create(tag: 'News')])
  end

  scenario 'user can filter links by tag bubbles' do
    visit '/tags/bubbles'
    expect(page).to have_content('bubbles')
    expect(page).not_to have_content('BBC')
  end
end
