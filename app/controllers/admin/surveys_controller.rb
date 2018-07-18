class Admin::SurveysController < Admin::BaseController
  
  def index
    @surveys = Survey.all
  end
end