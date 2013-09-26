class ProfilesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  
  before_action :owns_profile, only: [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    #@search = Profile.search do
      #fulltext params[:search]
    #end
    #@profiles = Profile.all 
    if params[:locate].present?
      @search = Profile.near(params[:locate], 50).search(params[:q])      
    else
      @search = Profile.search(params[:q])
    end
    
    @profiles = @search.result.page(params[:page]).per(10)
      
    #@search = Profile.search(params[:q]) 
    #@profiles = @search.result(distinct: true).order("name").page(params[:page], per_page => 10)
    #@profiles = Profile.near(params[:search], 50).search(params[:search]).relation.paginate(:page => params[:page], :per_page => 9)
    #@profiles = @search.result
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    #@profile = Profile.new
    @user = current_user
    @profile = Profile.new(:user_id => @user.id)
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    #@profile = Profile.new(profile_params)
    @profile = current_user.profiles.build(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    
    def owns_profile
      #if !user_signed_in? || current_user != Profile.find(params[:id]).user
      if !user_signed_in? || current_user.profiles.find_by(id: params[:id]).nil?
        redirect_to profiles_path, error: "Cannot modify profiles you don't own"
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :description, :experience, :show_type, :current_location, :base_price,
       :user_id, :image, :youtube_url, :name, :google_calendar, :latitude, :longitude)
    end
end
