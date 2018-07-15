require 'rails_helper'

describe 'an admin' do
  context 'visiting their show page' do
    it 'will see their name, screen_name, email and colors they added to database' do
      admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')

      visit admin_path(admin)
 
      expect(page).to have_content("Name: #{admin.name}")
      expect(page).to have_content("Screen Name: #{admin.screen_name}")
      expect(page).to have_content("Contact: #{admin.email}")
      expect(page).to have_content(bmp.name)
      expect(page).to have_content(bmp.hex_value)
    end

    it 'sees a form to add a color to the database' do
      admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
      color_name = 'SpringGreen'
      color_hex_value = '#00FF7F'

      visit admin_path(admin)

      click_on 'Add a color to the Chromotherapy database'

      expect(current_path).to eq(new_admin_color_path(admin))
    end
  end
end