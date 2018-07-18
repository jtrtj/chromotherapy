require 'rails_helper'

describe 'user powers' do

    before(:each) do
      @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

  it 'can add colors to the database' do
    new_color_name = 'Spring Green'
    new_color_hex_value = '#00FF7F'

    visit user_path(@user)

    click_link 'Add a color to the Chromotherapy database'

    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value

    click_on 'Create Color'

    expect(current_path).to eq(color_path(Color.last))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
  end

  it 'can edit colors it added in the database' do
    spring_green = @user.colors.create(name: 'Spring Green', hex_value: '#00FF7F')
    new_color_name = 'hgasdf'
    new_color_hex_value = '#000F7F'

    visit user_path(@user)

    within "#color-#{spring_green.id}" do
      click_link 'edit'
    end
    
    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value

    click_on 'Update Color'

    expect(current_path).to eq(color_path(Color.last))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
  end
end