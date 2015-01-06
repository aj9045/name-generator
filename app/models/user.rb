class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :username
  validates_presence_of :username, :name
  validates_presence_of :password_digest, on: :create

  has_many :entries, :dependent => :destroy
  has_many :first_names, through: :entries
  has_many :last_names, through: :entries

end