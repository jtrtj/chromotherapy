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

  def edit
    @admin = Admin.find(params[:admin_id])
    @color = Color.find(params[:id])
  end

  def destroy
    admin = Admin.find(params[:admin_id])
    color = Color.find(params[:id])
    color.destroy
    redirect_to admin_path(admin)
  end

  def color_params
    params.require(:color).permit(:name, :hex_value)
  end

end