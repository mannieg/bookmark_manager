# Not certain about this:
#require '.app/models/user'
require 'capybara/rspec'

feature 'Sign up' do

  scenario 'user count increases when a user signs up' do

    # Not sure about this
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, RoiRoi@gmail.com"
    expect(User.first.email).to eq "RoiRoi@gmail.com"
  end
end
