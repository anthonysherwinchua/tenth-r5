class Admin::ApplicantsController < Admin::BaseController

  before_action :prepare_new_applicant, only: [:new, :create]
  before_action :prepare_applicant, only: [:show, :edit, :update]
  before_action :prepare_form, only: [:new, :create, :edit, :update]

  def index
    authorize Applicant
    @applicants = Applicant.includes(:civil_status).order(first_name: :asc, last_name: :asc)
  end

  def show
    render action: :show, layout: false if request.xhr? == 0
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @form.save(applicant_params)
      redirect_to admin_applicants_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @form.save(applicant_params)
      redirect_to admin_applicants_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_applicant
    @applicant = Applicant.new.tap { |record| authorize record }
  end

  def prepare_applicant
    @applicant = Applicant.includes(:religion, :citizenship, :civil_status).find(params[:id]).tap { |record| authorize record }
  end

  def applicant_params
    params.require(:applicant).permit(:religion_id, :citizenship_id, :civil_status_id,
      :first_name, :last_name, :middle_name, :suffix_name, :birthday, :birthplace,
      :gender, :height, :weight, :video_url)
  end

  def prepare_form
    @form = ApplicantForm.new(@applicant)
  end

end
