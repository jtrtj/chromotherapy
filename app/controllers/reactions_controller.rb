class ReactionsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @reaction = Reaction.new
  end

  def create
    @admin = Admin.find(params[:admin_id])
    @reaction = @admin.reactions.create!(reaction_params)
    if @reaction.save
      redirect_to admin_path(@admin)
      flash.notice = "#{@reaction.word} has been added to chromotherapy."
    else
      render :new
    end
  end

  def reaction_params
    params.require(:reaction).permit(:word, :definition)
  end
end