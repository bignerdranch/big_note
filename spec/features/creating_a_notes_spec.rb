require 'rails_helper'

RSpec.feature "CreatingANotes", type: :feature do
  it 'allows creating a note' do
    note_title = 'New Note Title'
    create_a_note(note_title)
    edit_a_note(note_title)
  end

  def create_a_note(note_title)
  	visit '/notes'
    click_on 'New Note'
    fill_in 'Title', with: note_title
    fill_in 'Body', with: 'New Note Body'
    click_on 'create'
    expect(page).to have_current_path('/notes')
    expect(page).to have_content(note_title)
  end 

  def edit_a_note(note_title)
    visit '/notes'
    click_on note_title
    fill_in 'Title', with: 'Edited note title'
    fill_in 'Body', with: 'Edited note body'
    click_on 'save'
    expect(page).to have_selector('input[value="Edited note title"]')
    expect(page).to have_content('Edited note body')
    click_on 'close'
    expect(page).to have_current_path('/notes')
    expect(page).to have_content('Edited note title')
  end 

end
