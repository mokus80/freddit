class IdeasController < ApplicationController

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
    @idea = Idea.new ideas_params
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
  end

  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @idea }
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    # Ideas.find(params[:id]).update(params)
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
  end

  def destroy
    # Ideas.find(params[:id]).destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      # format.json { head :no_content }
    end
  end

  def vote_up
    @idea = Idea.find(params[:id])
    current_user.vote_up(@idea)
    respond_to do |format|
      format.js
    end
  end

  private
  def ideas_params
    params.require(:idea).permit(:name, :title, :content)
  end
end
