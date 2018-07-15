class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end
  
  def new
    @admin = Admin.find(params[:admin_id])
    @color = Color.new
  end

  def create
    admin = Admin.find(params[:admin_id])
    color = admin.colors.create!(color_params)
    if color.save
      redirect_to admin_path(admin)
    else
      render :new
    end
  end

  def destroy
    Color.find(params[:id]).destroy
    redirect_to admin_path(params[:admin_id])
  end

  def color_params
    params.require(:color).permit(:name, :hex_value)
  end

end