class IdeasController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :vote_up]
  # before_filter :correct_user,   only: [:edit, :update, :destroy]

  def index
  @idea = Idea.all
 
  respond_to do |format|
    format.html  # index.html.erb
    #format.json  { render :json => @ideas }
  end
  end

  def new
    @idea = Idea.new
 
  respond_to do |format|
    format.html  # new.html.erb
    # format.json  { render :json => @idea }
    end
  end

  def create
    if signed_in? #current_user
      @idea = Idea.new ideas_params
      @idea.user = current_user
      @idea.save
      # if @idea.save
      #   redirect_to @idea, notice: 'Idea succesfully created'
      # else
      #   render action: new
      # end
    else 
      deny_access
    end
    # @idea = Idea.new ideas_params
    #   # @idea.name = params[:idea][:name]
    #   # @idea.title = params[:idea][:title]
    #   # @idea.content = params[:idea][:content]
    # # logger.info "in create"
    # respond_to do |format|
    #   if @idea.save
    #     # logger.info "save successful"
    #     format.html {redirect_to @idea, notice: 'Idea was succesfully created'}
    #   else 
    #     # logger.info "save failed"
    #     format.html {render action: "new"}
    #   end
    # end
  end

  def show
    @idea = Idea.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   # format.json { render json: @idea }
    # end
  end

  def edit
    @idea = Idea.find(params[:id])
    deny_access unless current_user?(@idea.user)
  end

  def update
    # Ideas.find(params[:id]).update(params)
    @idea = Idea.find(params[:id])
    # redirect_to root_url unless current_user?(@idea.user)

    respond_to do |format|
      if @idea.update_attributes(ideas_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # Ideas.find(params[:id]).destroy
    @idea = Idea.find(params[:id])
    if current_user?(@idea.user)
      @idea.destroy
    else 
      deny_access
    end
  
    
    # @idea = Idea.find(params[:id])
    # @idea.destroy

    # respond_to do |format|
    #   format.html { redirect_to ideas_url }
    #   # format.json { head :no_content }
    # end
  end

  def vote_up
    @idea = Idea.find(params[:id])
    if signed_in?
      current_user.vote_for(@idea)
    else
      deny_access
    end
  end

  def deny_access
    redirect_to signin_path
  end

  private
  def ideas_params
    params.require(:idea).permit(:name, :title, :content, :user_id)
  end


end
