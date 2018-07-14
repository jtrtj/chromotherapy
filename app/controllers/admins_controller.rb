class AdminsController < ApplicationController
  def show
    @admin = Admin.includes(:colors).find(params[:id])
  end
end