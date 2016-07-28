def sign_up
  visit '/users/new'
  fill_in 'email', with: 'RoiRoi@gmail.com'
  fill_in 'password', with: 'orangepassword'
  fill_in 'password_repeat', with: 'orangepassword'
  click_button('Sign_Up')
end
