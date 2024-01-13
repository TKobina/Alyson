class PagesController < ApplicationController
  before_action :authorize_user

  def index

  end

  private

  def authorize_user
    if current_user
      @ME = current_user.email == User.first.email
    else
      @ME = false
    end
  end


end
