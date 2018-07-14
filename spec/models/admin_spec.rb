require 'rails_helper'

describe Admin do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:screen_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}

    it {should validate_uniqueness_of(:screen_name).case_insensitive}
    it {should validate_uniqueness_of(:email).case_insensitive}
  end

  context 'class methods' do
    it '#authenticate' do
      admin = Admin.create!(name: 'John', screen_name: 'jtr', email: 'jtr022@gmail.com', password: 'cool')

      expect(Admin.authenticate('jtr', 'cool')).to eq(admin)
      expect(Admin.authenticate('jtr', 'chg')).to eq(nil)
    end
  end
end