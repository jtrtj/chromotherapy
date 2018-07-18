require 'rails_helper'

describe Survey do
  context 'validations' do
    it {should validate_presence_of(:color_id)}
    it {should validate_presence_of(:reaction_id)}
    it {should validate_presence_of(:user_id)}
  end
  
  context 'relationships' do
    it {should belong_to(:color)}
    it {should belong_to(:reaction)}
    it {should belong_to(:user)}
  end

  context 'class methods' do
    it '#sort_by_color(color)' do
      user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
      happy = user.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
      color_1 = user.colors.create(name: 'Ssdfghdfd', hex_value: '#123456')
      color_2 = user.colors.create(name: 'hgfd', hex_value: '#654321')
      survey_1 = color_1.surveys.create(user: user, reaction: happy)
      survey_2 = color_1.surveys.create(user: user, reaction: happy)
      survey_3 = color_2.surveys.create(user: user, reaction: happy)
      
      expect(Survey.sort_by_color(color_1)).to eq([survey_1, survey_2])
    end

    it '#sort_by_reaction(reaction)' do
      user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
      happy = user.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
      sad = user.reactions.create!(word: 'Sad', definition: 'feeling or showing displeasure or incontentment.')
      color_1 = user.colors.create(name: 'Ssdfghdfd', hex_value: '#123456')
      survey_1 = color_1.surveys.create(user: user, reaction: happy)
      survey_2 = color_1.surveys.create(user: user, reaction: happy)
      survey_3 = color_1.surveys.create(user: user, reaction: sad)
      
      expect(Survey.sort_by_reaction(happy)).to eq([survey_1, survey_2])
    end
  end
end