require 'capybara/rspec'

feature 'Sign in' do
  scenario 'User signs in correctly' do
    sign_up
    visit 'users/login'
    fill_in "email", with: "RoiRoi@gmail.com"
    fill_in "password", with: "orangepassword"
    click_button "Sign in"
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, you have signed in as RoiRoi@gmail.com"
  end
end
