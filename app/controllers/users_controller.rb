class UsersController < ApplicationController
  def create
    @user = User.find_or_create_by_email(params[:email])
  end
end
