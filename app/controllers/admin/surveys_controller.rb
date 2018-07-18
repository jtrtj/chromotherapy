class Admin::SurveysController < Admin::BaseController
  
  def index
    @surveys = Survey.all
  end

  def destroy
    Survey.destroy(params[:id])
    redirect_to admin_surveys_path
  end
end