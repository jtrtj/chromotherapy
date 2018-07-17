require 'rails_helper'

describe 'a user' do
  context 'visiting colors index' do
    xit "sees all colors and can click on one to see it's show page" do
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

  context 'an admin user visiting colors index' do
    it 'sees a button to add a new color' do
      admin = User.create(email: 'sdfg', name: 'uytrew', password: 'trew', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit colors_path

      expect(page).to have_button('add color to database')
    end
  end

  context 'a default user visiting colors index' do
    it 'does not see a button to add a new color' do
      user = User.create(email: 'sdfg', name: 'uytrew', password: 'trew')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit colors_path

      expect(page).to_not have_button('add color to database')
    end
  end
end