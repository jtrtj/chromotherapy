class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end
  
  def show
    @color = Color.find(params[:id])
  end

  def new
    @admin = Admin.find(params[:admin_id])
    @color = Color.new
  end

  def create
    @admin = Admin.find(params[:admin_id])
    @color = @admin.colors.create!(color_params)
    if @color.save
      redirect_to admin_path(@admin)
      flash.notice = "#{@color.name} has been added to chromotherapy."
    else
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @color = Color.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:admin_id])
    @color = Color.find(params[:id])
    @color.update(color_params)
    if @color.save
      redirect_to admin_path(@admin)
      flash.notice = "#{@color.name} has been updated."
    else
      flash.notice = "Colors cannot be duplicated."
      render :edit
    end
  end

  def destroy
    admin = Admin.find(params[:admin_id])
    color = Color.find(params[:id])
    color.destroy
    redirect_to admin_path(admin)
    flash.notice = "#{color.name} has been removed chromotherapy"
  end

  private 
  
  def color_params
    params.require(:color).permit(:name, :hex_value)
  end

end