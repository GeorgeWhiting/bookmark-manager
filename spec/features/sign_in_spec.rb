feature 'has a functioning login page' do
  scenario 'has a sign up form with fields for email and password' do
    sign_up
    expect(page).to have_current_path('/links')
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, example@coldmail.com"
    expect(User.first.email).to eq 'example@coldmail.com'
  end

  scenario 'doesnt create a new user if password confirmation fails' do
    sign_up(password_confirmation: 'notcorrect')
    expect {sign_up(password_confirmation: 'notcorrect')}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Passwords do not match"
  end

  scenario 'user cannot sign up with a blank email address' do
    sign_up(email: '')
    expect {sign_up(email: '')}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Invalid Email"
  end
end
