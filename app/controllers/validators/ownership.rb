class ValidateOwnership < ActiveModel::Validator

  def validate(restaurant)
    unless restaurant.user_id == current_user.id
      restaurant.errors[:owner] << 'Only the creator of a restaurant can edit it'
      redirect '/'
    end
  end

end