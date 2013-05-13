class UsersController < ApplicationController
  def create
    @user = User.find_or_create_by_email(params[:email])
    if @user.persisted?
      UserMailer.welcome(@user.email).deliver
    end
  end
end
