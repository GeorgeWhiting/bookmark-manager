feature 'has a functioning login page' do
  scenario 'has a sign up form with fields for email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path('/links')
    expect(page).to have_content "Welcome, example@coldmail.com"
    expect(User.first.email).to eq 'example@coldmail.com'
  end

  scenario 'doesnt create a new user if password confirmation fails' do
    expect {sign_up(password_confirmation: 'notcorrect')}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'user cannot sign up with a blank email address' do
    expect {sign_up(email: nil)}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect {sign_up(email: 'abcdef')}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'user cannot sign up with an already registered email address' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end
end
