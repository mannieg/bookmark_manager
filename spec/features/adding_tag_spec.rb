require 'capybara/rspec'

feature 'New tag' do
  scenario 'adding a new tag to bookmark' do
    visit '/links/new'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    fill_in 'tags', with: 'TV'
    click_button('Create_link')

    expect(current_path).to eq '/links'

    link = Link.first
    expect(link.tags.map(&:name)).to include('TV')

  end
end
