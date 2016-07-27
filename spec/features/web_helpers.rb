def sign_up
  visit '/sign_up'
  fill_in 'email', with: 'RoiRoi@gmail.com'
  fill_in 'password', with: 'orangepassword'
  click_button('Sign_Up')
end
