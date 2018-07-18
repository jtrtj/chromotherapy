class ColorsController < ApplicationController
  
  def index
    @colors = Color.all
  end
  
  def show
    @color = Color.find(params[:id])
    @reactions = Reaction.all
    @survey = Survey.new
  end

  def new
    @user = User.find(params[:user_id])
    @color = Color.new
  end

  def create
    @user = User.find(params[:user_id])
    @color = @user.colors.create!(color_params)
    if @color.save
      redirect_to color_path(@color)
      flash.notice = "#{@color.name} has been added to chromotherapy."
    else
      render :new
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    @color.update(color_params)
    if @color.save
      redirect_to color_path(@color)
      flash.notice = "#{@color.name} has been updated."
    else
      flash.notice = "Colors cannot be duplicated."
      render :edit
    end
  end

  def destroy
    color = Color.find(params[:id])
    color.destroy
    redirect_to user_path(current_user)
    flash.notice = "#{color.name} has been removed from chromotherapy"
  end

  private 
  
  def color_params
    params.require(:color).permit(:name, :hex_value)
  end

end