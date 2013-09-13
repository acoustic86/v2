class ShowRequestsController < ApplicationController
  before_action :set_show_request, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]  
  before_action :owns_show_request, only: [:edit, :update, :destroy]

  # GET /show_requests
  # GET /show_requests.json
  def index
    @show_requests = ShowRequest.all
  end

  # GET /show_requests/1
  # GET /show_requests/1.json
  def show
    @profile = Profile.find(params[:profile_id])
  end

  # GET /show_requests/new
  def new
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @show_request = ShowRequest.new(:user_id => @user)
  end

  # GET /show_requests/1/edit
  def edit
    @profile = Profile.find(params[:profile_id])
    #@show_request = ShowRequest.find(show_request_params)    
  end
  
  # POST /show_requests
  # POST /show_requests.json
  def create    
    @profile = Profile.find(params[:profile_id])
    @show_request = @profile.show_requests.build(show_request_params)
    #@show_request = current_user.show_requests.build(show_request_params)
    @show_request.user_id = current_user.id
    

    respond_to do |format|
      if @show_request.save
        format.html { redirect_to profile_show_request_path(@profile, @show_request), notice: 'Show request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @show_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_requests/1
  # PATCH/PUT /show_requests/1.json
  def update    
    
    respond_to do |format|
      if @show_request.update(show_request_params)
        format.html { redirect_to profile_show_request_path(@show_request.profile, @show_request), notice: 'Show request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_requests/1
  # DELETE /show_requests/1.json
  def destroy
    @show_request.destroy
    respond_to do |format|
      format.html { redirect_to show_requests_url }
      format.json { head :no_content }
    end
  end

  private
  
    def owns_show_request
      #if !user_signed_in? || current_user != Profile.find(params[:id]).user
      if !user_signed_in? || current_user.show_requests.find_by(id: params[:id]).nil?
        redirect_to show_requests_path, error: "Cannot modify profiles you don't own"
      end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_show_request
      @show_request = ShowRequest.find(params[:id])
    end   

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_request_params
      params.require(:show_request).permit(:show_date, :show_time, :description)
    end
end
