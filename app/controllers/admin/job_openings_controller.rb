class Admin::JobOpeningsController < Admin::BaseController

  before_action :prepare_new_job_opening, only: [:new, :create]
  before_action :prepare_job_opening, only: [:show, :edit, :update]
  before_action :prepare_form, only: [:new, :create, :edit, :update]

  def index
    authorize JobOpening
    @job_openings = JobOpening.includes(:country, :occupation).order(country_id: :asc)
  end

  def show
    @requirements = @job_opening.requirements.includes(:document).order('documents.name asc')
    render action: :show, layout: false if request.xhr? == 0
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @form.save(job_opening_params)
      redirect_to admin_job_openings_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @form.save(job_opening_params)
      redirect_to admin_job_openings_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_job_opening
    @job_opening = JobOpening.new.tap { |record| authorize record }
  end

  def prepare_job_opening
    @job_opening = JobOpening.includes(:country, :occupation).find(params[:id]).tap { |record| authorize record }
  end

  def job_opening_params
    params.require(:job_opening).permit(:country_id, :occupation_id, :enabled)
  end

  def prepare_form
    @form = JobOpeningForm.new(@job_opening)
  end

end
