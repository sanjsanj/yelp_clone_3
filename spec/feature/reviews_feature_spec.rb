require 'rails_helper'
require 'helpers/reviews'
require 'helpers/users'
require 'helpers/restaurants'

include ReviewSpecHelpers
include UserSpecHelpers
include RestaurantSpecHelpers

feature 'reviewing' do
  before do
    sign_up_and_sign_in
    create_a_restaurant
  end

  scenario 'allows users to leave a review using a form' do
    write_review('KFC')
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('I bloody loved it')
  end

  scenario 'does not allow user to review a restaurant twice' do
    write_review('KFC')
    visit '/'
    expect(page).not_to have_link 'Review KFC'
  end
end
