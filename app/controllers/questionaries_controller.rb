class QuestionariesController < ApplicationController
  def create
    Questionary.create(params[:questionary])
  end
end
