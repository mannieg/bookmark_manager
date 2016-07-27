feature 'Sign up' do
  before do
    visit '/signup'
    fill_in 'First Name:', with: 'Mannie'
    fill_in 'Last Name:', with: ''
    fill_in 'Email:', with: 'mannie.com'
    fill_in 'Password:', with: 'Password123'
    click_button('Signup')
  end

  scenario 'when a user signs up the User account count increases by 1' do
    expect(User.count).to eq 1
  end
  scenario 'user is shown a welcome page' do
    expect(page).to have_content 'Hi Mannie! Welcome to your new Bookmark Manager account.'
  end
  scenario 'input email address is the same as database entry' do
    expect(User.first[:email]).to eq 'mannie.com'
  end
end
