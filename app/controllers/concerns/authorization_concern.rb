  
module AuthorizationConcern
  extend ActiveSupport::Concern

  included do
    before_action :check_privilege
    before_action :get_record, only: [:show, :edit, :update, :destroy]
  end

  private
  def check_ownership(record)
    redirect_to '/404' unless record.user_id == current_user.id
  end
  
  def check_privilege
    redirect_to root_path unless current_user and current_user.privileged
  end
end