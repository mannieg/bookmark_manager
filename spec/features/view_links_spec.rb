require 'capybara/rspec'

# Sort out web_helpers.rb later and get rid of:
def sign_up
  visit '/users/new'
  fill_in 'email', with: 'RoiRoi@gmail.com'
  fill_in 'password', with: 'orangepassword'
  click_button('Sign_Up')
end

feature 'See list of links' do
  scenario 'on homepage' do

    sign_up

    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content "makersacademy"
    end
  end
end


feature 'Visit links' do

    before(:each) do
      sign_up
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
      Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
      Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    end

  scenario 'I can filter links by tag' do
    visit 'tags/bubbles'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'This is Zombocom'
      expect(page).to have_content 'Bubble Bobble'
      expect(page).not_to have_content 'Makers Academy'
      expect(page).not_to have_content 'Codecademy'
    end
  end

end
