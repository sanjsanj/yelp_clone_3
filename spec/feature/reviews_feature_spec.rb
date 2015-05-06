require 'rails_helper'
require 'helpers/reviews'

include ReviewSpecHelpers

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    write_review('KFC')
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('I bloody loved it')
  end

  scenario 'does not allow user to review a restaurant twice' do
    write_review('KFC')
    click_link 'Review KFC'
    expect(page).not_to have_button 'Leave Review'
  end

end
