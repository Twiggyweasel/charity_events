class DonationsController < ApplicationController
  def index
    @donations = current_user.donations
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = current_user.donations.build(donation_params)

    if @donation.save
      redirect_to @donation, notice: 'Donation was successfully created.'
    else
      render :new
    end
    # @donation = Donation.new(donation_params)

    # respond_to do |wants|
    #   if @donation.save
    #     flash[:notice] = 'Donation was successfully created.'
    #     wants.html { redirect_to(:donations) }
    #     wants.xml  { render :xml => @donation, :status => :created, :location => @donation }
    #   else
    #     wants.html { render :action => "new" }
    #     wants.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])

    respond_to do |wants|
      if @donation.update(donation_params)
        flash[:notice] = 'Donation was successfully updated.'
        wants.html { redirect_to(@donation) }
        wants.xml  { head :ok }
      else
        wants.html { render :edit }
        wants.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |wants|
      wants.html { redirect_to(:donations) }
      wants.xml  { head :ok }
    end
  end

  private
    def donation_params
      params.require(:donation).permit(:method, :amount, :honorific, :paid, :payment_date, :user_id)
    end
end
