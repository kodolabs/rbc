#encoding: utf-8

class Admin::RegistrationsController < Admin::BaseController

  def index
    @registrations = Registration.all
  end

  def destroy
    @reg = Registration.find params[:id]

    if @reg.destroy
      redirect_to :back, notice: 'Регистрация удалена'
    else
      redirect_to :back, error: 'Регистрация не была удалена'
    end
  end
end
