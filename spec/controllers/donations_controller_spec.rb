require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  let(:user) { instance_double(User) }

  before { log_in(user) }

  describe "Get #index" do
    let(:donations) { [
      instance_double(Donation),
      instance_double(Donation)
    ] }

    before do
      allow(user).to receive(:donations).and_return(donations)
      get :index
    end

    it "looks up all donations that belong to the current user" do
      expect(assigns(:donations)).to eq(donations)
    end
  end
end
