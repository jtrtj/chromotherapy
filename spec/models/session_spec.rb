require 'rails_helper'

describe Session do
  context 'validations' do
    it {should validate_presence_of(:color_id)}
    it {should validate_presence_of(:reaction_id)}
  end
  
  context 'relationships' do
    it {should belong_to(:color)}
    it {should belong_to(:reaction)}
  end
end