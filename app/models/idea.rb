class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :poster, presence: true
end
