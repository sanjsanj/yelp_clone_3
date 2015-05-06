module ReviewSpecHelpers

  def write_review(restaurant_name)
    visit '/'
    click_link "Review #{restaurant_name}"
    fill_in 'Thoughts', with: "I bloody loved it!"
    click_button 'Leave Review'
  end

end