require 'rails_helper'

describe LastName do
  describe "validations" do
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of :last_name }
  end
  describe "associations" do
    it { should have_many :entries }
    it { should have_many(:users).through(:entries) }
  end
end