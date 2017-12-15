describe User do
  let!(:user) do
    User.create(email: 'example@coldmail.com', password: 'password', password_confirmation: 'password')
  end
  it 'authenticates when given valid login details' do
    expect(user.authenticate('password')).to eq true
  end
  it 'doesnt authenticate when given invalid login details' do
    expect(user.authenticate('incorrectpassword')).to eq false
  end
end
