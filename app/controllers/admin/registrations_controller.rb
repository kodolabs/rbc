#encoding: utf-8

class Admin::RegistrationsController < Admin::BaseController

  def index
    @registrations = Registration.all
  end

  def confirm
    @registration = Registration.find params[:id]

    if @registration.update_attributes status: 'confirmed'
      UserMailer.confirm(@registration).deliver
      redirect_to :back, notice: 'Статус подтвержден'
    else
      redirect_to :back, error: 'Failed to update status'
    end
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
