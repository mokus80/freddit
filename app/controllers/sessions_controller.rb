class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by(email: params[:sessions][:email].downcase)

    # puts "!!!email is " + params["sessions"]["email"]
	sign_in user
	redirect_to ideas_path
end

def destroy
  sign_out
  redirect_to signin_path
end

end
