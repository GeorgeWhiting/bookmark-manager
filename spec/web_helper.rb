def sign_up
  visit '/users/new'
  fill_in('email', with: 'example@coldmail.com')
  fill_in('password', with: 'password')
  fill_in('password_confirmation', with: 'password')
  click_button('Sign Up')
end

def sign_up_badly
  visit '/users/new'
  fill_in('email', with: 'example@coldmail.com')
  fill_in('password', with: 'password')
  fill_in('password_confirmation', with: 'notcorrect')
  click_button('Sign Up')
end
