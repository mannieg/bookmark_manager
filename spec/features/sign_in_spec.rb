feature 'Sign in' do
  scenario 'User signs in correctly' do
    User.create(email: "RoiRoi@gmail.com", password: "orangepassword",
                password_repeat: "orangepassword")
    visit 'users/login'
    fill_in "email", with: "RoiRoi@gmail.com"
    fill_in "password", with: "orangepassword"
    click_button "Sign in"
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, RoiRoi@gmail.com"
  end
end
