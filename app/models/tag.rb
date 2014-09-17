class Tag < ActiveRecord::Base
  has_and_belongs_to_many :stories

  self.per_page = 500
end