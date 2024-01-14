class EntitiesController < ApplicationController
  #before_action :authorize_user
  before_action :check_ownership, only: [:show, :edit, :update, :destroy]

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

  def entity_params
    params.require(:entity).permit(:name, :about)
  end
  
  def check_ownership
    @entity = Entity.find(params[:id])
    redirect_to entities_path and return unless @entity.user_id == current_user.id
  end
  
  def authorize_user
    @privileged = false
    @privileged = current_user.privileged if current_user
  end
end
