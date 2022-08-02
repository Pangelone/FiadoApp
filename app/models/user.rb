class User < ApplicationRecord
  # RELATIONS
  has_many :loans 
  has_many :payments

  # VALIDATIONS
  validates :name, presence: true
end
