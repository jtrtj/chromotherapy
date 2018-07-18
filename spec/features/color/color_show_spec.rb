require 'rails_helper'

describe 'a user' do
  context 'visiting color show page' do
    it 'will see the colors info' do
      admin = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool', role: 1)
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')

      visit color_path(bmp)

      expect(page).to have_content(bmp.name)
      expect(page).to have_content(bmp.hex_value)
    end

    it 'will see reactions associated with the color' do
      admin = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool', role: 1)
      user = User.create!(name: 'John', email: 'jtr022@fake.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
      happy = admin.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
      survey = bmp.surveys.create!(reaction: happy, user: user)

      visit color_path(bmp)
      expect(page).to have_content(happy.word)
      expect(page).to have_content(happy.definition)
    end
  end
end
