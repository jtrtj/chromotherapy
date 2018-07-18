require 'rails_helper'

describe 'a user' do
  before(:each) do
    @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
    @user.colors.create(name: 'Ssdfghdfd', hex_value: '#123456')
    @user.colors.create(name: 'jhgf', hex_value: '#987098')
  end
  context 'visiting colors index' do
    it "sees all colors and can click on one to see it's show page" do
      admin = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
      black = admin.colors.create!(name: 'black', hex_value: '#000000')

      visit colors_path
    
      click_on "#{bmp.name}"
    
     
      expect(current_path).to eq(color_path(bmp))
    end
  end

  context 'an admin user visiting colors index' do
    it 'sees a button to add a new color' do
      admin = User.create(email: 'sdfg', name: 'uytrew', password: 'trew', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit colors_path

      expect(page).to have_link('add color to database')
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