require 'rails_helper'

describe 'an admin' do
  before(:each) do
    @admin = User.create(email: '456@real.net', name: 'Homer', password: 'trew', role: 1)
    @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it 'can see a list of all sessions' do
    visit admin_surveys_path

  end
end