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

  describe "Patch #update" do
    let(:donation) { FactoryBot.build_stubbed(:donation) }

    before do
      allow(Donation).to receive(:find).and_return(donation)
      allow(donation).to receive(:update).and_return(true)
    end

    it "updates the donation" do
      patch :update, :params => {
        :id => donation.id,
        :donation => { :amount => 5 }
      }

      expect(donation).to have_received(:update)
    end

    context "when the update succeeds" do
      it "redirects to the donation page" do
        patch :update, :params => {
          :id => donation.id,
          :donation => { :amount => 5 }
        }

        expect(response).to redirect_to(donation_path(donation))
      end
    end

    context "when the update fails" do
      before do
        allow(donation).to receive(:update).and_return(false)
      end

      it "renders the update page again" do
        patch :update, :params => {
          :id => donation.id,
          :donation => { :amount => 5 }
        }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:donation) { FactoryBot.build_stubbed(:donation) }

    before do
      allow(Donation).to  receive(:find).and_return(donation)
      allow(donation).to  receive(:destroy)

      delete :destroy, :params => { :id => donation.id }
    end

    it "deletes the donation" do
      expect(donation).to have_received(:destroy)
    end

    it "redirects to the index page" do
      expect(response).to redirect_to(donations_path)
    end
  end
end