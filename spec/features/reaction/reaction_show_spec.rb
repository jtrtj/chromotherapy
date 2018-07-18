require 'rails_helper'

describe 'a user' do
  context 'visiting reaction show page' do
    it "will see the reaction's info" do
      user = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool')
      calm = user.reactions.create!(word: 'calm', definition: 'not showing or feeling nervousness, anger, or other emotions.')

      visit reaction_path(calm)

      expect(page).to have_content(calm.word)
      expect(page).to have_content(calm.definition)
    end

    it 'will see colors associated with the reaction' do
      admin = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool', role: 1)
      user = User.create!(name: 'John', email: 'jtr022@fake.com', password: 'cool')
      bmp = admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
      happy = admin.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
      survey = bmp.surveys.create!(reaction: happy, user: user)

      visit reaction_path(happy)
      expect(page).to have_content(bmp.name)
    end
  end
end
