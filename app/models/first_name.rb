class FirstName < ActiveRecord::Base
  validates_presence_of :first_name
  validates_uniqueness_of :first_name

  has_many :entries
  has_many :users, through: :entries
end