class ReactionsController < ApplicationController
  before_action :current_admin?,  only: [:new, :create, :edit, :update, :destroy]

  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = current_user.reactions.create!(reaction_params)
    if @reaction.save
      redirect_to user_path(current_user)
      flash.notice = "#{@reaction.word} has been added to chromotherapy."
    else
      render :new
    end
  end

  def edit
    @reaction = Reaction.find(params[:id])
  end

  def update
    @reaction = Reaction.find(params[:id])
    @reaction.update(reaction_params)
    if @reaction.save
      redirect_to user_path(current_user)
      flash.notice = "Reaction has been updated."
    else
      flash.notice = "Reactions cannot be duplicated."
      render :edit
    end
  end

  def destroy
    reaction = Reaction.find(params[:id])
    reaction.destroy
    redirect_to user_path(current_user)
    flash.notice = "#{reaction.word} has been removed chromotherapy"
  end

  private 

  def reaction_params
    params.require(:reaction).permit(:word, :definition)
  end
end