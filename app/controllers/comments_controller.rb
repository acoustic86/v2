class CommentsController < ApplicationController
  before_filter :load_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]  
  before_action :owns_comment, only: [:edit, :update, :destroy]
  
  # GET /requests
  # GET /requests.json
  def index
    @comments = @commentable.comments
  end

  # GET /requests/new
  def new
    @comment = @commentable.comments.new
  end

  # POST /requests
  # POST /requests.json
  def create 
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: "Comment created."}
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)       
        #format.html { redirect_to profile_request_path(@request.profile, @request), notice: 'Request was successfully updated.' }
        format.html { redirect_to profile_path(@comment.request_id), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
  
    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
  
    def owns_comment
       @request = Request.find(params[:request_id])
      #if !user_signed_in? || current_user != Profile.find(params[:id]).user
      if !user_signed_in? || current_user.comments.find_by(id: params[:id]).nil? 
        redirect_to requests_path, error: "Cannot modify requests you don't own" 
      end
    end    
  
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end   

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :comment, :user_id, :request_id, :commentable_id)
    end
 
end