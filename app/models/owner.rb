class Owner < ApplicationRecord
  belongs_to :user
  has_many :homes
  has_many :bookinghomes
end
