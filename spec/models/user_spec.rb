require 'rails_helper'

describe User do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}

    it {should validate_presence_of(:name)}
    
    it {should validate_presence_of(:password)}
  end
  describe 'relationships' do
    it {should have_many(:colors)}
    it {should have_many(:reactions)}
    it {should have_many(:surveys)}
  end
end