require 'spec_helper'

feature 'A user can sign in' do

  let!(:user) do

  User.create(email: 'summerisawesome@gmail.com',
              password: '1234',
              password_confirmation: '1234')
  end

  scenario 'An existing user signs in' do
    visit '/sessions/new'
    fill_in('email', :with => user.email)
    fill_in('password', :with => user.password)
    click_button('login')
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome, #{user.email}")
  end
end
