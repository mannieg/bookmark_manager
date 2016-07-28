def sign_up(email: 'RoiRoi@gmail.com', password_repeat: 'orangepassword')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: 'orangepassword'
  fill_in 'password_repeat', with: password_repeat
  click_button('Sign_Up')
end
