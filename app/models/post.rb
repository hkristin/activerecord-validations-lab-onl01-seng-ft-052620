class Post < ActiveRecord::Base
  validates :title, length: { minimum: 1 }
  validates(:content, { :length => { :is => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

end
