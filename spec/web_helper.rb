def sign_up
  visit '/users/new'
  fill_in('email', with: 'example@coldmail.com')
  fill_in('password', with: 'password')
  click_button('Sign Up')
end
