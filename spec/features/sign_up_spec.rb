feature 'Sign up' do
  scenario 'when a user signs up the User account count increases by 1' do
    visit '/signup'
    expect(page.status_code).to eq(200)

    fill_in 'Email:', with: 'Mannie'
    fill_in 'Password:', with: 'Password123'
    click_button('Signup')
    expect(User.count).to change_by(1)
  end
end
