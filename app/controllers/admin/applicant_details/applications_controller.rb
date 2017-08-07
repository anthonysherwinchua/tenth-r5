class Admin::ApplicantDetails::ApplicationsController < Admin::BaseController

  before_action :prepare_applicant
  before_action :prepare_application, only: [:edit, :update]

  def index
    @applications = @applicant.applications
    render action: :index, layout: false if request.xhr? == 0
  end

  def show
    @presenter = ApplicantDocumentsPresenter.new(params[:id])
    render action: :show, layout: false if request.xhr? == 0
  end

  def new
    @application = @applicant.applications.new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    @application = @applicant.applications.new(application_params)
    if @application.save
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @application.update_attributes(application_params)
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_applicant
    @applicant = Applicant.includes(:applications).find(params[:applicant_id]).tap { |record| authorize record }
  end

  def prepare_application
    @application = @applicant.applications.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:job_opening_id, :applicant_code, :date_applied, :availability, :available)
  end

end
