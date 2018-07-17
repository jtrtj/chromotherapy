require 'rails_helper'

describe 'registration work-flow' do

  it 'submits a registration form successfully' do
    email = 'megan_fox@hotmail.com'
    name = 'Megan Fox'

    visit root_path

    click_on 'sign up'

    expect(current_path).to eq(new_user_path)

    fill_in :user_email, with: email
    fill_in :user_name, with: name
    fill_in :user_password, with: '12345'
    
    within '.box' do
      click_on 'sign up'
    end

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{name}!")
  end

  it 'submits a registration form with duplicate email' do
    email = 'megan_fox@hotmail.com'
    name = 'Megan Fox'
    User.create(email: email, name: name, password: 'gfdsadfg')
    user_count = User.count

    visit root_path

    click_on 'sign up'

    expect(current_path).to eq(new_user_path)

    fill_in :user_email, with: email
    fill_in :user_name, with: name
    fill_in :user_password, with: '12345'

    within '.box' do
      click_on 'sign up'
    end

    expect(User.count).to eq(user_count)
    expect(current_path).to eq(users_path)
  end
end
