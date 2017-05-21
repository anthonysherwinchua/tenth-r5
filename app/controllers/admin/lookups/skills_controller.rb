class Admin::Lookups::SkillsController < Admin::BaseController

  before_action :prepare_new_skill, only: [:new, :create]
  before_action :prepare_skill, only: [:edit, :update]

  def index
    authorize Skill
    @skills = Skill.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @skill.update_attributes(skill_params)
      redirect_to admin_lookups_skills_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @skill.update_attributes(skill_params)
      redirect_to admin_lookups_skills_path, notice: 'Successfully updated record.'
    else
      render :edit
    end
  end

  private

  def prepare_new_skill
    @skill = Skill.new.tap { |record| authorize record }
  end

  def prepare_skill
    @skill = Skill.find(params[:id]).tap { |record| authorize record }
  end

  def skill_params
    params.require(:skill).permit(:name, :enabled)
  end

end
