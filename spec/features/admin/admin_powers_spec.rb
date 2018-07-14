require 'rails_helper'

describe 'an admin' do
  it 'can add colors to db' do
    admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
    new_color_name = 'Spring Green'
    new_color_hex_value = '#00FF7F'

    visit new_admin_color_path(admin)

    
    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value

    click_on 'Add Color'

    expect(curret_path).to eq(admin_show_path(admin))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
  end
end
