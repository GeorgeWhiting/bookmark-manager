feature 'has a functioning sign in page' do
  scenario 'has a sign in form with fields for email and password' do
    sign_up
    sign_in
    expect(page).to have_current_path('/links')
    expect(page).to have_content "Welcome, example@coldmail.com"
    expect(User.first.email).to eq 'example@coldmail.com'
  end

  scenario 'doesnt log you in if you enter incorrect details' do
    sign_up
    sign_in(password: "definitelywrong")
    expect(page).to have_current_path('/')
  end
end
