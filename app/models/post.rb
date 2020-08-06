class Post < ActiveRecord::Base
  validates :name, uniqueness: true, length: { minimum: 2 }
  validates(:content_length, { :length => { minimum: 250} })
end
