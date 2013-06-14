#encoding: utf-8

require 'csv'

class Admin::RegistrationsController < Admin::BaseController

  def index
    respond_to do |format|
      format.html do
        @registrations = Registration.desc(:created_at).all
      end

      format.csv do
        filename = 'registrations.csv'

        headers["Content-Type"] ||= 'text/csv'
        headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
        headers["Content-Transfer-Encoding"] = 'binary'

        csv_string = CSV.generate do |csv|
          csv << ['Name', 'Email']
          Registration.all.each do |reg|
            csv << [reg.name, reg.email]
          end
        end
        render :text => csv_string
      end
    end
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
      UserMailer.cancel(@reg).deliver

      redirect_to :back, notice: 'Регистрация удалена'
    else
      redirect_to :back, error: 'Регистрация не была удалена'
    end
  end
end
