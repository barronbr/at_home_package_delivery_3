class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user.present?
      @packages = current_user.packages.all
      @schedules = current_user.schedules.all
    else
      render 'welcome'
    end
  end

end
