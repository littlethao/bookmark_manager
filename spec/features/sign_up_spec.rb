require_relative 'web_helper'

feature 'Sign up' do
  scenario 'user signs up to bookmark manager site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, littlethao@me.com')
    expect(User.first.email).to eq 'littlethao@me.com'
  end

  scenario 'user signs up with a mismatching password' do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user signs up with a blank email' do
    expect{ sign_up(email: '')}.not_to change(User, :count)
    expect(page).to have_content("Password confirmation:")
    expect(User.all).to be_empty
  end

  scenario 'user received error message when signing up with already registered email address' do
    sign_up
    sign_up
    expect(page).to have_content('Email is already taken')
  end
end
