require 'rails_helper'

describe Admin do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:screen_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}

    it {should validate_uniqueness_of(:screen_name)}
  end
end