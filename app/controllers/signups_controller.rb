class SignupsController < ApplicationController
  def new
  	@signup = Signup.new
  end
  def create
  	@signup = Signup.new(signup_params)
  	if @signup.save
       redirect_to @signup, notice: 'User was successfully created.'
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

  private
  def signup_params
  	params.require(:signup).permit(:email)
  end
end
