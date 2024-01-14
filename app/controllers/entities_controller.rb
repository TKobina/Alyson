class EntitiesController < ApplicationController
  before_action :authorize_user

  def index
    
    @entities = Entity.all.select { |x| x.user_id == current_user.id }
  end

  private

  def authorize_user
    @privileged = false
    @privileged = current_user.privileged if current_user
  end
end
