require 'rails_helper'

describe 'reactions index' do
  context 'a user visiting reactions index' do
    it 'will see all reactions' do
      admin = User.create(email: 'sdfg', name: 'uytrew', password: 'trew', role: 1)
      reaction_1 = admin.reactions.create(word: 'sdfgh', definition: 'hgfds')

      visit reactions_path

      expect(page).to have_content(reaction_1.word)
      expect(page).to have_content(reaction_1.definition)
    end
  end
end