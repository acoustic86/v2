class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]  
  before_action :owns_request, only: [:edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @profile = Profile.find(params[:profile_id])
  end

  # GET /requests/new
  def new
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @request = Request.new(:user_id => @user)
  end

  # GET /requests/1/edit
  def edit
    @profile = Profile.find(params[:profile_id])
    #@request = Request.find(request_params)    
  end
  
  # POST /requests
  # POST /requests.json
  def create    
    @profile = Profile.find(params[:profile_id])
    @request = @profile.requests.build(request_params)
    #@request = current_user.requests.build(request_params)
    @request.user_id = current_user.id
    

    respond_to do |format|
      if @request.save
        format.html { redirect_to profile_request_path(@profile, @request), notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update    
    
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to profile_request_path(@request.profile, @request), notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
  
    def owns_request
      #if !user_signed_in? || current_user != Profile.find(params[:id]).user
      if !user_signed_in? || current_user.requests.find_by(id: params[:id]).nil?
        redirect_to requests_path, error: "Cannot modify profiles you don't own"
      end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end   

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:date, :time, :description)
    end
end
