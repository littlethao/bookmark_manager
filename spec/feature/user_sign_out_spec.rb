require 'spec_helper'

feature 'Sign out user' do
  let!(:user) do
    User.create(email: 'summerisawesome@gmail.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'current user signing out session' do
    visit '/sessions/new'
    fill_in('email', :with => user.email)
    fill_in('password', :with => user.password)
    click_button('login')

    visit '/session/end'
    click_button('logout')
    expect(current_path).to eq '/links'
    expect(page).to have_content 'See you'
    expect(page).not_to have_content "Welcome, #{user.email}"
  end
end
