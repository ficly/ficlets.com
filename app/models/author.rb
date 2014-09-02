class Author < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  self.per_page = 204
end