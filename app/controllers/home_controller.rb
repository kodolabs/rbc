class HomeController < ApplicationController
  def index
    @user = User.new
    @questionary = Questionary.new
  end
end
