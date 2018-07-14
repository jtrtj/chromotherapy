class ColorsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @color = Color.new
  end
end