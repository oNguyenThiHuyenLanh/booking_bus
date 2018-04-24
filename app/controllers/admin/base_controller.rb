module Admin
  class BaseController < ApplicationController
    layout "application_admin"
    before_action :check_admin

    def check_admin
      redirect_to new_user_session_path unless current_user &&
                                               current_user.admin?
    end
  end
end
