class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:sessions][:email].downcase)
  	sign_in user
  		# if user && user.authenticate(params[:session][:email])
    # #Sign the user in and redirect to the user's show page.
  		# else
    # #Create an error message and re-render the signin form.
  		# end
  	redirect_to ideas_url
  end

 def destroy
    sign_out
    redirect_to root_url
 end
end
