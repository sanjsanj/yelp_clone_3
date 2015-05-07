class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true
  belongs_to :user

  def has_been_reviewed_by user
    self.reviews.each do |review|
      return true if review.user_id == user.id
    end
  false
  end

end
