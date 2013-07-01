class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by(email: params[:sessions][:email].downcase)

    # puts "!!!email is " + params["sessions"]["email"]
	if user.nil?
		redirect_to signup_path
	else
		sign_in user
		redirect_to root_path
	end
end

def destroy
  sign_out
  redirect_to signin_path
end

end
