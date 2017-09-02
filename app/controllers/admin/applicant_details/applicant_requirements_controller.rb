class Admin::ApplicantDetails::ApplicantRequirementsController < Admin::BaseController

  before_action :prepare_applicant
  before_action :prepare_applicant_requirement, only: [:edit, :update]

  def new
    @applicant_requirement = @applicant.applicant_requirements.new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    @applicant_requirement = @applicant.applicant_requirements.new(applicant_requirement_params)
    if @applicant_requirement.save
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @applicant_requirement.update_attributes(applicant_requirement_params)
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_applicant
    @applicant = Applicant.includes(:applicant_requirements).find(params[:applicant_id]).tap { |record| authorize record }
  end

  def prepare_applicant_requirement
    @applicant_requirement = @applicant.applicant_requirements.find(params[:id])
  end

  def applicant_requirement_params
    params.require(:applicant_requirement).permit(:document_id, :apply, :arrive, :expire, :note)
  end

end
