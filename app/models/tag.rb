class Tag < ActiveRecord::Base
  has_and_belongs_to_many :stories

  before_destroy { stories.clear }

  self.per_page = 500
end