require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
      described_class.new(first_name: "Richard", last_name: "Wise", email: "orsusbass@gmail.com", password: "pa$$word")
  }

  describe "Associations" do
    it { should have_many(:organization_members) }
    it { should have_many(:organizations) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    # it "is not valid without a first_name" do
    #   subject.first_name = nil
    #   expect(subject).to_not be_valid
    # end

    # it "is not valid without a last_name" do
    #   subject.last_name = nil
    #   expect(subject).to_not be_valid
    # end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Methods" do
    it "should return first_name last_name as full name" do
      expect(subject.full_name).to eq("Richard Wise")
    end
  end
end
