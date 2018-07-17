require 'rails_helper'

describe 'reactions index' do
  context 'a user visiting reactions index' do
    it 'will see all reactions and will not see a button to add a reaction' do
      admin = User.create(email: 'sdfg', name: 'uytrew', password: 'trew', role: 1)
      user = User.create(email: 'bbfsd', name: 'nnbgv', password: 'yew45')
      reaction_1 = admin.reactions.create(word: 'sdfgh', definition: 'hgfds')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit reactions_path

      expect(page).to have_content(reaction_1.word)
      expect(page).to have_content(reaction_1.definition)
      expect(page).to_not have_content('add reaction to database')
    end
  end
end