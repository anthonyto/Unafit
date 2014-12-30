class ChargesController < ApplicationController
  def new
  end
  
  def create
    # amount in cents, so $100 
    @amount = 100

    # create a new customer
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail], 
      :card => params[:stripeToken]
    )

    # create a new charge to be sent to Stripe
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    # Set all payment attributes
    current_user.client_profile.active = true 
    current_user.client_profile.number_of_payments+1
    current_user.client_profile.last_payment = Time.now
    current_user.client_profile.save
    
    flash[:notice] = "Thanks, you payment was successful!"
    redirect_to user_path(current_user)

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
end
