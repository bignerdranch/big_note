require 'rails_helper'

RSpec.feature "CreatingANotes", type: :feature do
  it 'allows creating a note' do
    create_a_note
  end

  def create_a_note 
  	visit '/notes'
    click_on 'New Note'
    fill_in 'Title', with: 'New Note Title'
    fill_in 'Body', with: 'New Note Body'
    click_on 'create'
    expect(page).to have_current_path('/notes')
    expect(page).to have_content('New Note Title')
  end 

end
