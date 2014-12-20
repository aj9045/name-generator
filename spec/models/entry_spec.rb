require 'rails_helper'

describe Entry do
  describe "validations" do
    it { should validate_presence_of :user_id }
  end
  describe "associations" do
    it { should belongs_to :user }
    it { should belongs_to :first_name }
    it { should belongs_to :last_name }
  end
end
