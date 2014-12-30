class Entry < ActiveRecord::Base
  validates_presence_of :user_id, :first_name_id, :last_name_id

  belongs_to :first_name
  belongs_to :last_name
  belongs_to :user
end