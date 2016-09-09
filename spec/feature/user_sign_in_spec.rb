require 'spec_helper'

feature 'A user can sign in' do

  let!(:user) do

  User.create(email: 'summerisawesome@gmail.com',
              password: '1234',
              password_confirmation: '1234')
  end

  scenario 'An existing user signs in' do
    sign_in
    expect(current_path).to eq '/links'
    expect(page).to have_content("Welcome, #{user.email}")
  end
end
