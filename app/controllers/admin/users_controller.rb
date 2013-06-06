require 'csv'

class Admin::UsersController < Admin::BaseController

  def index
    respond_to do |format|
      format.csv do

        filename = 'subscribers.csv'

        headers["Content-Type"] ||= 'text/csv'
        headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
        headers["Content-Transfer-Encoding"] = "binary"

        csv_string = CSV.generate do |csv|
          csv << ["Email"]
          User.all.each do |user|
            csv << [user.email]
          end
        end
        render :text => csv_string
      end
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to :back, notice: 'Successfully deleted'
    else
      redirect_to :back, error: 'Error deleting user'
    end
  end

end
