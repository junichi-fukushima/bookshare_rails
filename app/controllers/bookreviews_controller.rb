class BookreviewsController < ApplicationController
    before_action :select_book, only: [:show, :edit, :update, :destroy]
    def index
    end    

    def new
        @bookreview = Bookreview.new
    end    

    def create
        @bookreview = Bookreview.new(book_params)
        if @bookreview.valid?
            @bookreview.save
          return redirect_to root_path, alert: '投稿が完了しました。'
        end
        render 'new'
    end    

    private

    def book_params
      params.require(:bookreview).permit(
        :image,
        :author,
        :text,
        :genre_id,
      ).merge(user_id: current_user.id)
    end
  
    def select_book
      @bookreview = Bookreview.find(params[:id])
    end
  
end
