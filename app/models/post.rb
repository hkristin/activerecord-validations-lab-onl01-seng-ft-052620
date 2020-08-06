class Post < ActiveRecord::Base
  validates :title, length: { minimum: 1 }
  validates(:content, { :length => { :is => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validates :not_clickbaity_title

  def not_clickbaity_title
    if !clickbaity_title.present?
      valid
    else
      errors.add(:clickbaity_title, "can't be a clickbait-y title")
    end
  end
end
