class LastName < ActiveRecord::Base
  validates_presence_of :last_name
  validates_uniqueness_of :last_name

  has_many :entries
  has_many :users, through: :entries
end