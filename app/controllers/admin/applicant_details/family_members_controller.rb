class Admin::ApplicantDetails::FamilyMembersController < Admin::BaseController

  before_action :prepare_applicant
  before_action :prepare_family_member, only: [:edit, :update]

  def new
    @family_member = @applicant.family_members.new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    @family_member = @applicant.family_members.new(family_member_params)
    if @family_member.save
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @family_member.update_attributes(family_member_params)
      redirect_to admin_applicant_path(@applicant), notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_applicant
    @applicant = Applicant.includes(:family_members).find(params[:applicant_id]).tap { |record| authorize record }
  end

  def prepare_family_member
    @family_member = @applicant.family_members.find(params[:id])
  end

  def family_member_params
    params.require(:applicant_family_member).permit(:relationship_id, :occupation, :name, :age, :salary)
  end

end
