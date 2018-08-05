require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {
    described_class.new(name: "Test_Name", status: 1, start_date: DateTime.now, end_date: DateTime.now + 1.week, description: "Anything")
  }
  describe "Associations" do
    it { should belong_to(:organization) }
    it { should have_many(:donations) }
  end

  describe "Enum" do
    it { should define_enum_for(:status) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a status" do
      subject.status = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a start_date" do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an end_date" do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
