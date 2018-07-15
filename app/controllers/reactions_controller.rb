class ReactionsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @reaction = Reaction.new
  end
end