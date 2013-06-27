class SessionsController < ApplicationController

def new
end

 params = { 
  "utf8"=>"✓", 
  "authenticity_token"=>"AmolamwcKMQmrb61FoouiaeHu+GAPEta2WpwSS/DXRw=",
  "sessions" => {"email"=>"me@me.com"}, 
  "commit"=>"Sign in", 
  "action"=>"create", 
  "controller"=>"sessions"     
 }
def create
	user = User.find_by(email: params[:sessions][:email].downcase)

    # puts "!!!email is " + params["sessions"]["email"]
	sign_in user
	redirect_to ideas_path
end

def destroy
	sign_out user
end

end
