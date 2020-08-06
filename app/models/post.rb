class Post < ActiveRecord::Base
  validates :title, length: { minimum: 1 }
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :non_clickbaity_title

    def non_clickbaity_title
      clickbaity_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]

      if clickbaity_words.include?(self.title)
        false
      else
        true
      end

    end

end
