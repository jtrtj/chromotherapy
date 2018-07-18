require 'rails_helper'

describe 'registered user powers' do

    before(:each) do
      @user = User.create(email: '123@fake.net', name: 'Bart', password: 'haha')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

  it 'can add colors to the database' do
    new_color_name = 'Spring Green'
    new_color_hex_value = '#00FF7F'

    visit user_path(@user)

    click_link 'Add a color to the Chromotherapy database'

    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value

    click_on 'Create Color'

    expect(current_path).to eq(color_path(Color.last))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
  end

  it 'can edit colors it added in the database' do
    spring_green = @user.colors.create(name: 'Spring Green', hex_value: '#00FF7F')
    new_color_name = 'hgasdf'
    new_color_hex_value = '#000F7F'

    visit user_path(@user)

    within "#color-#{spring_green.id}" do
      click_link 'edit'
    end
    
    fill_in :color_name, with: new_color_name
    fill_in :color_hex_value, with: new_color_hex_value

    click_on 'Update Color'

    expect(current_path).to eq(color_path(Color.last))
    expect(page).to have_content(new_color_name)
    expect(page).to have_content(new_color_hex_value)
  end

  it 'can delete colors it added in the database' do
    spring_green = @user.colors.create(name: 'Spring Green', hex_value: '#00FF7F')
    new_color_name = 'hgasdf'
    new_color_hex_value = '#000F7F'

    visit user_path(@user)

    within "#color-#{spring_green.id}" do
      click_link 'delete'
    end

    expect(current_path).to eq(user_path(@user))
    expect(page).to_not have_content(new_color_name)
    expect(page).to_not have_content(new_color_hex_value)
  end

  it 'can add reactions to the database' do
    new_reaction_word = 'Sad'
    new_reaction_definition = 'Not Happy'

    visit user_path(@user)

    click_link 'Add a reaction to the Chromotherapy database'

    fill_in :reaction_word, with: new_reaction_word
    fill_in :reaction_definition, with: new_reaction_definition

    click_on 'Create Reaction'

    expect(current_path).to eq(reaction_path(Reaction.last))
    expect(page).to have_content(new_reaction_word)
    expect(page).to have_content(new_reaction_definition)
  end

  it 'can edit reactions it added in the database' do
    reaction = @user.reactions.create(word: 'Awesome', definition: 'inspiring awe')
    new_reaction_word = 'Sad'
    new_reaction_definition = 'Not Happy'

    visit user_path(@user)

    within "#reaction-#{reaction.id}" do
      click_link 'edit'
    end
    
    fill_in :reaction_word, with: new_reaction_word
    fill_in :reaction_definition, with: new_reaction_definition

    click_on 'Update Reaction'

    expect(current_path).to eq(reaction_path(reaction))
    expect(page).to have_content(new_reaction_word)
    expect(page).to have_content(new_reaction_definition)
    expect(page).to_not have_content('Awesome')
    expect(page).to_not have_content('inspiring awe')
  end
end