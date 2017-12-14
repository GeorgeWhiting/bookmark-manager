feature 'has a functioning login page' do
  scenario 'has a sign up form with fields for email and password' do
    sign_up
    expect(page).to have_current_path('/links')
    expect(page).to have_content "Welcome, example@coldmail.com"
    expect(User.first.email).to eq 'example@coldmail.com'
  end
end
