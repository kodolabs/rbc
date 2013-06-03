class Admin::UsersController < ApplicationController
  def destroy
    user = User.find params[:id]
    if user.destroy
      redirect_to :back, notice: 'Successfully deleted'
    else
      redirect_to :back, error: 'Error deleting user'
    end
  end
end
