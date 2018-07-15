require 'rails_helper'

describe 'an admin' do
  it 'can add colors to db' do
    admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
    new_color_name = 'Spring Green'
    new_color_hex_value = '#00FF7F'

    visit new_admin_color_path(admin)
    
    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value

    click_on 'Create Color'

    expect(current_path).to eq(admin_path(admin))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
  end

  it 'can delete colors from db' do
    admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
    spring_green = admin.colors.create!(name: 'Spring Green', hex_value: '#00FF7F')
    bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')

    visit admin_path(admin)

    within "#color-#{spring_green.id}" do
      click_on 'Delete'
    end
    
    expect(current_path).to eq(admin_path(admin))
    expect(page).to_not have_content(spring_green.name)
    expect(page).to_not have_content(spring_green.hex_value)
  end
end
