require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:user) { User.new(first_name: "Richard", last_name: "Wise", email: "orsusbass@gmail.com") }
  subject{
    described_class.new(name: "Test_Name", owner: user)
  }

  describe "Assocations" do
    it { should belong_to(:owner) }
    it { should have_many(:organization_members) }
    it { should have_many(:members) }
    it { should have_many(:events) }
    it { should have_many(:donations) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end
end
