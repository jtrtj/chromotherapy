require 'rails_helper'

describe 'an admin' do
  context 'visiting their show page' do
    it 'will see their name, screen_name, email and colors added to database' do
      admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')

      visit admin_path(admin)

      expect(page).to have_content("Name: #{admin.name}")
      expect(page).to have_content("Screen Name: #{admin.screen_name}")
      expect(page).to have_content("contact: #{admin.email}")
      expect(page).to have_content(bmp.name)
      expect(page).to have_content(bmp.hex_value)
    end
  end
end