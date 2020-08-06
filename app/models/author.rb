class Author < ActiveRecord::Base
  validates :email, uniqueness: true
end
