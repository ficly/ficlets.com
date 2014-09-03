class Author < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy

  self.per_page = 204
end