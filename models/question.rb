class Question < ActiveRecord::Base
  belongs_to :survey

  validates_presence_of :title
end
