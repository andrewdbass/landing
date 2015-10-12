require 'securerandom'
class SignupsController < ApplicationController
  def new
  	@signup = Signup.new
  end
  def create
    params[:signup][:link] = SecureRandom.hex(6)
    params[:signup][:referral] = params[:referral] if params[:referral]
  	@signup = Signup.new(signup_params)
  	if @signup.save
      @referrer = Signup.find_by(link: @signup.referral)
      @referrer.update(referred: @referrer.referred + 1) if @referrer
      SignupMailer.status_email(@referrer).deliver 
      SignupMailer.welcome_email(@signup).deliver
      redirect_to confirmation_path(@signup)
    else
       render :new 
    end
  end
  def show
  	@signup = Signup.find(params[:id])
  end
  def index
  	@signups = Signup.all
  end
  def confirmation
    @signup = Signup.find(params[:id])
  end
  
  private
  def signup_params
  	params.require(:signup).permit(:email, :referral, :link)
  end
end
