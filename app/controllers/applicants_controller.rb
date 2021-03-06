class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = Applicant.all
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    if params[:username]
      checkusername
    end
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
    1.times { @applicant.comments.build } if session[:user_id]
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html {
          UserMailer.registration_confirmation(@applicant).deliver
          redirect_to @applicant, notice: 'Applicant was successfully created and will send u email your information.'
        }
        format.json { render action: 'show', status: :created, location: @applicant }
      else
        format.html { render action: 'new' }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkusername
    if Applicant.where('username = ?', params[:username]).count == 0
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 409
    end
    return
  end

  def check_user
    user = params[:username]
    user = Applicant.where("username = ?", username).first
    if user.present?
      render :json =>  ["free-user", false , "This User is already taken"]
    else
      render :json =>  ["free-user", true , ""]
    end
  end

  # PATCH/PUT /applicants/1
  # PATCH/PUT /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: 'Applicant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])     unless params[:username]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.require(:applicant).permit(:username,:name, :fname, :address, :dob, :contact, :edu, :comment, :comments_attributes => [:comment])
    end
end
