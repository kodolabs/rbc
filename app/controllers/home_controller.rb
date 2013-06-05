class HomeController < ApplicationController
  def index
    @user = User.new
    @questionary = Questionary.new
  end

  def program

  end
end
