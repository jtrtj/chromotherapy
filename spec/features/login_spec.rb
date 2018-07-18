require 'rails_helper'

describe 'login workflow' do
  before(:each) do
    @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
    @user.colors.create(name: 'Ssdfghdfd', hex_value: '#123456')
    @user.colors.create(name: 'jhgf', hex_value: '#987098')
  end

  it 'allows registered users to log in successfully' do
    user = User.create(email: 'jt@r.com', name: 'j', password: 'test')
    
    visit root_path
    click_on 'log in'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    within '#log-in-button' do
      click_button 'log in'
    end
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('log out')
    expect(page).to_not have_content('log in')
  end

  it 'allows registered users to log out' do
    user = User.create(email: 'jt@r.com', name: 'j', password: 'test')

    visit root_path
    click_on 'log in'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    within '#log-in-button' do
      click_button 'log in'
    end

    click_on 'log out'
    expect(current_path).to eq(root_path)
  end
end