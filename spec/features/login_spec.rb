require 'rails_helper'

describe 'login workflow' do
  it 'allows registered users to log in successfully' do
    user = User.create(email: 'jt@r.com', name: 'j', password: 'test')
    
    visit root_path
    click_on 'log in'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.username
    fill_in :password, with: user.password

    click_on 'log in'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('log out')
    expect(page).to_not have_content('log in')
  end

  xit 'allows registered users to log out' do
    user = User.create(username: 'KeeganTwoWords', password: 'test')

    visit root_path
    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Log In'

    click_on 'Log Out'
    expect(current_path).to eq(root_path)
  end
end