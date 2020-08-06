class Post < ActiveRecord::Base
  validates :name, uniqueness: true, length: { minimum: 2 }
end
