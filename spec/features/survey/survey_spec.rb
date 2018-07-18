require 'rails_helper'

describe 'a registered user' do
  before(:each) do
    @admin = User.create!(name: 'John', email: 'jtr022@gmail.com', password: 'cool', role: 1)
    @bmp = @admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
    @happy = @admin.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
    @user = User.create(email: 'test', name: 'tester', password: 'secret')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  context 'visiting color show page' do
    it 'will see a form to fill out a survey about the color' do
      visit color_path(@bmp)
      save_and_open_page
      
      select(@happy.word, from: :survey_reaction_id)

      click_on 'submit'

      expect(page).to have_content('Happy')
      expect(page).to have_content('feeling or showing pleasure or contentment.')
    end
  end
end
