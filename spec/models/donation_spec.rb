require 'rails_helper'

RSpec.describe Donation, type: :model do
  let(:user) { User.new(first_name: "Richard", last_name: "Wise", email: "orsusbass@gmail.com") }
  let(:event) { Event.new(name: "Test_Name", status: 1, start_date: DateTime.now, end_date: DateTime.now + 1.week, description: "Anything")}

  subject {
    described_class.new(method: 0, amount: 25.50, paid: false, user: user, donatable_id: event.id)
  }

  describe "Assocations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a method" do
      subject.method = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without an amount" do
      subject.amount = nil
      expect(subject).not_to be_valid
    end

    it "is invalid without an user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it "is invalid if paid without payment date" do
      subject.paid = true
      subject.payment_date = nil
      expect(subject).not_to be_valid
    end
  end
end
