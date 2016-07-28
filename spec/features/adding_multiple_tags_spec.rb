require 'capybara/rspec'

feature 'New multiple tags' do
  scenario 'adding multiple tags to each bookmark' do

    # Perhaps a better solution than this:
    #sign_up

    visit '/links/new'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    fill_in 'tags', with: 'TV radio news'
    click_button('Create_link')

    #expect(current_path).to eq '/links'

    link = Link.first
    expect(link.tags.map(&:name)).to include('TV', 'radio', 'news')

  end
end
