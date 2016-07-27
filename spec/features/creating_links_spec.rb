require 'capybara/rspec'

feature 'New links' do
  scenario 'adding a new link to bookmark' do

    # Perhaps a better solution than this:
    sign_up

    visit '/links/new'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    click_button('Create_link')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content "BBC"
    end

  end
end
