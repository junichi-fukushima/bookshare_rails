class LikesController < ApplicationController
  before_action :set_bookreview
  def create
    like = current_user.likes.build(bookreview_id: params[:bookreview_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(bookreview_id: params[:bookreview_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_bookreview
    @bookreview = Bookreview.find(params[:bookreview_id])
  end
end
