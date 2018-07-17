class Admin::ColorsController < Admin::BaseController
  def new
    @admin = Admin.find(params[:user_id])
    @color = Color.new
  end
end