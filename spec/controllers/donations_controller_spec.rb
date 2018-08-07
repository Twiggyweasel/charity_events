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

  describe "POST #create" do
    let(:donation) { FactoryBot.build_stubbed(:donation) }
    let(:params) { { method: 1, amount: 15.00 } }

    before do
      allow(donation).to receive(:save)
      allow(user).to receive_message_chain(:donations, :build).and_return(donation)
    end

    it "saves the donation" do
      post :create, :params => { :donation => params }

      expect(donation).to have_received(:save)
    end

    context "when the donation is successfully saved" do
      before do
        allow(donation).to receive(:save).and_return(true)

        post :create, :params => { :donation => params }
      end

      it "redirects to the donation show page" do
        expect(response).to redirect_to(donation_path(donation))
      end

      it "donation show page shows a sucess notice" do
        expect(flash[:notice]).to eq("Donation was successfully created.")
      end
    end

    context "when a donation can't be saved" do
      before do
        allow(donation).to receive(:save).and_return(false)

        post :create, :params => { :donation => params }
      end

      it "redirects back to the new page" do
        expect(response).to render_template(:new)
      end
    end
  end
end
