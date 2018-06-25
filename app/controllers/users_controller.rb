class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if user
    flash[:danger] = t "admin.error.invalid_user"
    redirect_to root_path
  end

  private

  attr_reader :user
end
