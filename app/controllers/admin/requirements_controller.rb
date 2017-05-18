class Admin::RequirementsController < Admin::BaseController

  before_action :prepare_job_opening
  before_action :prepare_new_requirement, only: [:new, :create]
  before_action :prepare_requirement, only: [:edit, :update]
  before_action :prepare_form, only: [:new, :create, :edit, :update]

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @form.save(requirement_params)
      redirect_to admin_job_opening_path(@job_opening), notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @form.save(requirement_params)
      redirect_to admin_job_opening_path(@job_opening), notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_job_opening
    @job_opening = JobOpening.find(params[:job_opening_id]).tap { |record| authorize record }
  end

  def prepare_new_requirement
    @requirement = @job_opening.requirements.new.tap { |record| authorize record }
  end

  def prepare_requirement
    @requirement = @job_opening.requirements.find(params[:id]).tap { |record| authorize record }
  end

  def requirement_params
    params.require(:requirement).permit(:document_id, :enabled)
  end

  def prepare_form
    @form = RequirementForm.new(@job_opening, @requirement)
  end

end
