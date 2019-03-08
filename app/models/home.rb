class Home < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :interactives

end
