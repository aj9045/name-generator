require 'rails_helper'

describe Entry do
  describe "validations" do
    it { should validate_presence_of :user_id }
  end
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :first_name }
    it { should belong_to :last_name }
  end
end
