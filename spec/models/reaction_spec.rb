require 'rails_helper'

describe Reaction do
  context 'validations' do
    it {should validate_presence_of(:word)}
    it {should validate_presence_of(:definition)}
    it {should validate_presence_of(:user_id)}

    it {should validate_uniqueness_of(:word).case_insensitive}
  end
  
  context 'relationships' do
    it {should belong_to(:user)}
    it {should have_many(:colors).through(:surveys)}
  end
end