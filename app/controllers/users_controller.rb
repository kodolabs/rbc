class UsersController < ApplicationController
  def create
    user = User.new(params[:user])
    @success = user.save
  end
end
