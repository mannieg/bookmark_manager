require 'capybara/rspec'

feature 'Sign up' do

  scenario 'user count increases when a user signs up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, RoiRoi@gmail.com"
    expect(User.first.email).to eq "RoiRoi@gmail.com"
  end

  scenario 'Validate password when they do not match' do
    visit '/users/new'
    fill_in 'email', with: 'RoiRoi@gmail.com'
    fill_in 'password', with: 'orangepassword'
    fill_in 'password_repeat', with: 'applepassword'
    click_button('Sign_Up')

    expect(User.count).to eq 0
  end
end
