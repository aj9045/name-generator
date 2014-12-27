require 'rails_helper'

describe FirstName do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_uniqueness_of :last_name }
  end
  describe "associations" do
    it { should have_many :entries }
    it { should have_many(:users).through(:entries) }
  end
end
