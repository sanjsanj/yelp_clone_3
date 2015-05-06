require 'rails_helper'

feature 'When a user is not logged in' do

  scenario 'they can not create a restaurant' do
    visit '/'
    click_link 'Add a restaurant'
    expect(page).not_to have_button('Create Restaurant')
  end
end
