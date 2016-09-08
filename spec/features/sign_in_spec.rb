feature 'Sign in' do
  scenario 'user signing in' do
    visit '/log_in'
    fill_in('email', with: 'hello@me.com')
    fill_in('password', with: 'asdf')
    click_button 'log-in'

    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcom back, hello@me.com'
  end
end
