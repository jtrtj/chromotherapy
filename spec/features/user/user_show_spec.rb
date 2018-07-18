require 'rails_helper'
describe 'user visiting their show page' do
  before(:each) do
    @admin = User.create(email: 'shfgjdj', name: 'uyertyfgh', password: 'trew', role: 1)
    @bmp = @admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
    @happy = @admin.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
    @user = User.create(email: 'sdfg', name: 'uytrew', password: 'trew')
  end
  
  context 'an admin' do
    it 'will see profile information, list of colors contributed and list of reactions contributed.' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  
      visit user_path(@admin)
    
      expect(page).to have_content(@bmp.name)
      expect(page).to have_content(@bmp.hex_value)
      expect(page).to have_content(@happy.word)
      expect(page).to have_content(@happy.definition)
    end
  end
  
  context 'a registered user' do    
    it 'will see profile information, list of their sessions' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      survey = @bmp.surveys.create(user: @user, reaction: @happy)

      visit user_path(@user)
      
      expect(page).to have_content(@bmp.name)
      expect(page).to have_content(@happy.word)
    end
  end
end