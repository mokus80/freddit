class UsersController < ApplicationController
<<<<<<< HEAD

#copied code from demo_app begin

def index
=======
  # GET /users
  # GET /users.json
  def index
>>>>>>> 9d239f693db17d006fe4440ea8085a668f4ba4f2
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
<<<<<<< HEAD
      #format.json { render json: @users }
=======
      # format.json { render json: @users }
>>>>>>> 9d239f693db17d006fe4440ea8085a668f4ba4f2
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
<<<<<<< HEAD
      #format.json { render json: @user }
=======
      # format.json { render json: @user }
>>>>>>> 9d239f693db17d006fe4440ea8085a668f4ba4f2
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      # format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new users_params

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(users_params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      # format.json { head :no_content }
    end
  end

  private
  	def users_params
    	params.require(:user).permit(:name, :email)
  	end
end