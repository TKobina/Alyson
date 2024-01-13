class PagesController < ApplicationController
  before_action :authorize_user

  def index

  end

  private

  def authorize_user
    @privileged = false
    @privileged = current_user.privileged if current_user
  end


end
