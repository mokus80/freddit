class IdeasController < ApplicationController

  def index
    @idea = Idea.all
   
    respond_to do |format|
      format.html  # index.html.erb
      #format.json  { render :json => @ideas }
    end
  end

  def new
    if signed_in?
      @idea = Idea.new
     
      respond_to do |format|
        format.html  # new.html.erb
        # format.json  { render :json => @idea }
      end
    else
      redirect_to signin_path
    end
  end

  def create
    if signed_in?
      @idea = Idea.new ideas_params
      @idea.user = current_user 
        # @idea.name = params[:idea][:name]
        # @idea.title = params[:idea][:title]
        # @idea.content = params[:idea][:content]
      # logger.info "in create"
      respond_to do |format|
        if @idea.save
          # logger.info "save successful"
          format.html {redirect_to @idea, notice: 'Idea was succesfully created'}
        else 
          # logger.info "save failed"
          format.html {render action: "new"}
        end
      end
    else
      redirect_to signin_path
    end
  end

  def show
    @idea = Idea.find(params[:id])
    #respond_to do |format|
     # format.html # show.html.erb
      # format.json { render json: @idea }
    #end
  end

  def edit
    if signed_in?
      @idea = Idea.find(params[:id])
    else
      redirect_to signin_path
    end
  end

  def update
    # Ideas.find(params[:id]).update(params)
    if signed_in?
      @idea = Idea.find(params[:id])
      respond_to do |format|
        if @idea.update_attributes(ideas_params)
          format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
          # format.json { head :no_content }
        else
          format.html { render action: "edit" }
          # format.json { render json: @micropost.errors, status: :unprocessable_entity }
        end
      end
    else 
      redirect_to signin_path
    end
  end

  def destroy
    # Ideas.find(params[:id]).destroy
    if signed_in?
      @idea = Idea.find(params[:id])
      @idea.destroy
    else
      redirect_to signin_path
    end

    # respond_to do |format|
    #   format.html { redirect_to ideas_url }
    #   # format.json { head :no_content }
    # end
  end

  def vote_up
    @idea = Idea.find(params[:id])
    if signed_in?
      current_user.vote_for(@idea)
      # respond_to do |format|
      #   format.js
      # end
    else 
      redirect_to signin_path
    end
  end

  private
  def ideas_params
    params.require(:idea).permit(:name, :title, :content, :user_id)
  end
end
