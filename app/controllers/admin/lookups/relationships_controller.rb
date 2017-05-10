class Admin::Lookups::RelationshipsController < Admin::BaseController

  before_action :prepare_new_relationship, only: [:new, :create]
  before_action :prepare_relationship, only: [:edit, :update]

  def index
    authorize Relationship
    @relationships = Relationship.order(name: :asc)
  end

  def new
    render action: :new, layout: false if request.xhr? == 0
  end

  def create
    if @relationship.update_attributes(relationship_params)
      redirect_to admin_lookups_relationships_path, notice: 'Successfully created record.'
    else
      render :new
    end
  end

  def edit
    render action: :edit, layout: false if request.xhr? == 0
  end

  def update
    if @relationship.update_attributes(relationship_params)
      redirect_to admin_lookups_relationships_path, notice: 'Successfully updated record.'
    else
      render :new
    end
  end

  private

  def prepare_new_relationship
    @relationship = Relationship.new.tap { |record| authorize record }
  end

  def prepare_relationship
    @relationship = Relationship.find(params[:id]).tap { |record| authorize record }
  end

  def relationship_params
    params.require(:relationship).permit(:name, :enabled)
  end

end
