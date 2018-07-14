require 'rails_helper'

describe Color do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:hex_value)}
    it {should validate_presence_of(:admin_id)}

    it {should validate_uniqueness_of(:hex_value).case_insensitive}
  end
end