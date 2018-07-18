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

      
    end
  end
end