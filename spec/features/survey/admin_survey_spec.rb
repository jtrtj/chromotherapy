require 'rails_helper'

describe 'an admin' do
  before(:each) do
    @admin = User.create(email: '456@real.net', name: 'Homer', password: 'trew', role: 1)
    @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
    @bmp = @admin.colors.create!(name: 'baker-miller-pink', hex_value: '#ff91af')
    @happy = @admin.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
    @survey = @bmp.surveys.create!(reaction: @happy, user: @user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it 'can see a list of all surveys' do
    visit user_path(@admin)

    click_link 'Surveys'

    expect(page).to have_content(@bmp.name)
    expect(page).to have_content(@happy.word)
    expect(page).to have_content(@user.name)
  end

  it 'can see a count of all surveys' do
    visit user_path(@admin)

    click_link 'Surveys'

    expect(page).to have_content(Survey.count)
  end
end