require 'rails_helper'

describe 'a registered user' do
  before(:each) do
    @admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')
    @bmp = @admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
    @happy = @admin.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
    @user = User.new(email: 'test', name: 'tester', password: 'secret')

    visit root_path
    click_on 'log in'

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    within '#log-in-button' do
      click_button 'log in'
    end
  end

  context 'visiting color show page' do
    it 'will see a form to fill out a survey about the color' do
      visit color_path(@bmp)

      select(@happy.word, from: :survey_reaction)

      click_on 'submit'

      expect(page).to have_content('Happy')
      expect(page).to have_content('feeling or showing pleasure or contentment.')
    end
  end
end
