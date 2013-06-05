class Admin::DashboardController < Admin::BaseController

  def show
    @users = User.all
    @questions = Questionary.all
  end

end
