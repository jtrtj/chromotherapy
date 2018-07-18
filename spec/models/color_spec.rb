require 'rails_helper'

describe Color do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:hex_value)}
    it {should validate_presence_of(:user_id)}

    it {should validate_uniqueness_of(:hex_value).case_insensitive}
  end
  
  context 'relationships' do
    it {should belong_to(:user)}
    it {should have_many(:reactions).through(:surveys)}
  end

  context 'class methods' do
    it '#pick_two' do
      user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
      color_1 = user.colors.create!(name: 'Deep Pink', hex_value: '#FF1493')
      color_2 = user.colors.create!(name: 'BMP', hex_value: '#FF91AF')

      expect(Color.pick_two[0].class).to eq(Color)
      expect(Color.pick_two[1].class).to eq(Color)
    end
  end
end

