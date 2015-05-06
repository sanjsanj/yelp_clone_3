require 'rails_helper'
require 'helpers/users'
require 'helpers/restaurants'

include UserSpecHelpers
include RestaurantSpecHelpers

feature 'Users must' do

  context 'be logged in' do

    scenario 'to create a restaurant' do
      visit '/'
      click_link 'Add a restaurant'
      expect(page).not_to have_button('Create Restaurant')
    end

  end

  context 'have created the restaurant' do

    before :each do
      sign_up_and_sign_in
      create_a_restaurant
      sign_out
      sign_up_and_sign_in({ email: 'newemail@mail.com', password: 'testtest123', password_confirmation: 'testtest123' })
    end

    scenario 'to edit the restaurant' do
      visit '/'
      click_link 'Edit KFC'
      expect(page).not_to have_button('Update Restaurant')
    end

    scenario 'to delete the restaurant' do

    end

  end

end
