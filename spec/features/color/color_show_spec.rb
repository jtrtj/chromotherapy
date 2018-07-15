require 'rails_helper'

describe 'a user' do
  context 'visiting color show page' do
    it 'will see the colors info' do
      admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')

      visit color_path(bmp)

      expect(page).to have_content(bmp.name)
      expect(page).to have_content(bmp.hex_value)
    end
  end
end
