class Post < ActiveRecord::Base
  validates :title, uniqueness: true, length: { minimum: 2 }
  validates(:post_content, { :length => { minimum: 250} })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
end
