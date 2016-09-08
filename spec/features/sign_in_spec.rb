feature 'Sign in' do

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  # scenario 'user signing in' do
  #   visit '/log_in'
  #   fill_in('email', with: 'hello@me.com')
  #   fill_in('password', with: 'asdf')
  #   click_button 'log-in'
  #
  #   expect(current_path).to eq '/links'
  #   expect(page).to have_content 'Welcom back, hello@me.com'
  # end
end
