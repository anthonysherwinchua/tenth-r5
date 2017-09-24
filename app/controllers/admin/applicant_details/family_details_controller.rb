class Admin::ApplicantDetails::FamilyDetailsController < Admin::BaseController

  before_action :prepare_applicant
  before_action :prepare_family_detail, only: [:edit, :update]

  def index
    @family_detail = @applicant.family_detail || ApplicantFamilyDetail.new
    render action: :index, layout: false if request.xhr? == 0
  end

  def new
    @family_detail = @applicant.build_family_detail
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    @family_detail = @applicant.build_family_detail(family_detail_params)
    if @family_detail.save
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @family_detail.update_attributes(family_detail_params)
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_applicant
    @applicant = Applicant.includes(:family_detail).find(params[:applicant_id]).tap { |record| authorize record }
  end

  def prepare_family_detail
    @family_detail = @applicant.family_detail
  end

  def family_detail_params
    params.require(:applicant_family_detail).permit(:sisters, :brothers, :no_in_fam, :children, :eldest, :youngest)
  end

end
