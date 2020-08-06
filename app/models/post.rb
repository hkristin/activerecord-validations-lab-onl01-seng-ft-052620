class Post < ActiveRecord::Base
  validates :title, length: { minimum: 1 }
  validates :content, { :length => { :is => 250 } }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :not_clickbaity_title

    def not_clickbaity_title
      clickbaity_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if clickbaity_words.include?(Post.title)
        errors.add(:clickbaity_title, "can't be a clickbait-y title")
      end
    end
end
