require 'active_record'

class Question < ActiveRecord::Base
  belongs_to :survey

  validates_presence_of :question
end
