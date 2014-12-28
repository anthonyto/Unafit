class ChargesController < ApplicationController
  def new
  end
  
  def create
    # amount in cents, so $100 
    @amount = 100

    # create a new customer
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com', 
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
    current_user.client_profile.paid = true 
    current_user.client_profile.number_of_payments++
    current_user.client_profile.last_payment = Time.now
    
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
    end
end
