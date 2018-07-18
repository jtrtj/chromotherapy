class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @color = Color.find(params[:color_id])
  end

  def create
    @color = Color.find(params[:color_id])
    @survey = @color.surveys.create!(survey_params)
    redirect_to color_path(@color)
  end

  private

  def survey_params
    params.require(:survey).permit(:reaction_id, :user_id)
  end
end