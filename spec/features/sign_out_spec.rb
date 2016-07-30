feature 'Sign out' do
  scenario 'User can sign out of account' do
    sign_up
    visit '/users/new'
    expect(page.status_code).to eq 200
    click_button 'logout'
    expect(current_path).to eq '/links'
    expect(page).to have_content('You have succesfully logged off!')
  end
end
