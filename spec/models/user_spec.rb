describe User do
  it 'confirms correct log in authentication' do
    user = User.create(email: "email@email.com", password: "password",
                password_repeat: "password")
    expect(User.authenticate(user.email, "password")).to be_kind_of User
  end
end
