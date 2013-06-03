class RegistrationsController < ApplicationController

  def new
    @registration = Registration.new email: params[:email]
  end

  def create
    @registration = Registration.new params[:registration]

    if @registration.save
      UserMailer.registration(@registration).deliver
      redirect_to action: :success
    else
      render :new
    end
  end

  def success

  end
end
