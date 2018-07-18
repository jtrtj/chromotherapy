require 'rails_helper'

#add a nother user
describe 'an admin' do
  before(:each) do
    @admin = User.create(email: '456@real.net', name: 'Homer', password: 'trew', role: 1)
    @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it "can delete anyone's colors from database" do
    color = @user.colors.create(name: 'Spring Green', hex_value: '#00FF7F')

    visit colors_path

    within "#color-#{color.id}" do
      click_on 'delete'
    end
  
    expect(current_path).to eq(colors_path)
    expect(page).to_not have_content(color.name)
  end

  it 'can edit colors anyone added to the database' do
    spring_green = @user.colors.create!(name: 'Spring Green', hex_value: '#00FF7F')
    new_color_name = 'GR8 COLOR'
    new_color_hex_value = '#FF1493'

    visit colors_path

    within "#color-#{spring_green.id}" do
      click_link 'edit'
    end
    
    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value
    click_on 'Update Color'
    
    expect(current_path).to eq(color_path(spring_green))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
    expect(page).to_not have_content('Spring Green')
    expect(page).to_not have_content('#00FF7F')
  end

  it 'can delete reactions anyone added to the database' do
    happy = @user.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
    
    visit reactions_path
    
    within "#reaction-#{happy.id}" do
      click_link 'delete'
    end

    expect(current_path).to eq(reactions_path)
    expect(page).to_not have_content(happy.word)
    expect(page).to_not have_content(happy.definition)
  end

  it 'can edit reactions anyone added to the database' do
    happy = @user.reactions.create!(word: 'Happy', definition: 'feeling or showing pleasure or contentment.')
    new_reaction_word = 'Overjoyed'
    new_reaction_definition = 'extremely happy.'

    visit reactions_path

    within "#reaction-#{happy.id}" do
      click_link 'edit'
    end
    
    fill_in :reaction_word, with: new_reaction_word
    fill_in :reaction_definition, with: new_reaction_definition
    click_on 'Update Reaction'

    expect(current_path).to eq(reaction_path(happy))
    expect(page).to have_content(new_reaction_word)
    expect(page).to have_content(new_reaction_definition)
    expect(page).to_not have_content('Happy')
    expect(page).to_not have_content('feeling or showing pleasure or contentment.')
  end
end
