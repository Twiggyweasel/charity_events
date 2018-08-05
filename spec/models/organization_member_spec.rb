require 'rails_helper'

RSpec.describe OrganizationMember, type: :model do

  let(:user) { User.new(first_name: "Richard", last_name: "Wise", email: "orsusbass@gmail.com") }
  let(:organization) { Organization.new(name:"Test Org") }

  subject {
    described_class.new(organization: organization, user: user, role: 1 )
  }
  describe "Assocations" do
    it { should belong_to(:organization) }

    it { should belong_to(:user) }
  end

  describe "Enum" do
    it { should define_enum_for(:role) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without an organization" do
      subject.organization = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without an user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without a role" do
      subject.role = nil
      expect(subject).not_to be_valid
    end
  end
end
