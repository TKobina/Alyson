class EntitiesController < ApplicationController
  include AuthorizationConcern


  def index
    @entities = Entity.all.select { |x| x.user_id == current_user.id }
  end
  
  def show
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id

    if @entity.save
      redirect_to @entity
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @entity.update(entity_params)
      redirect_to @entity
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entity.destroy
    redirect_to entities_path, status: :see_other
  end

  private

  def get_record
    @entity = Entity.find(params[:id])
    check_ownership(@entity)
  end

  def entity_params
    params.require(:entity).permit(:name, :about)
  end

end
