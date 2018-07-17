require 'rails_helper'

describe 'a user' do
  context 'visiting colors index' do
    it "sees all colors and can click on one to see it's show page" do
      admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
      black = admin.colors.create!(name: 'black', hex_value: '#000000')

      visit colors_path
    
      # expect(page).to have_css("#{bmp.hex_value}")
      # expect(page).to have_css("#{black.hex_value}")
    
    click_on "#color-#{bmp.id}"
    
     
     expect(current_path).to be(color_path(bmp))
    end
  end
end