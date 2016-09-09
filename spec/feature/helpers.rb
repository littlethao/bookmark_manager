module Helpers

  def sign_up(email: 'summerisawesome@gmail.com',
              password: '1234',
              password_confirmation: '1234')
    visit '/users/new'
    fill_in('email', :with => email)
    fill_in('password', :with => password)
    fill_in('password_confirmation', :with => password_confirmation)
    click_button 'Sign up'
  end

  def sign_in
    visit '/sessions/new'
    fill_in('email', :with => user.email)
    fill_in('password', :with => user.password)
    click_button('login')
  end
end
