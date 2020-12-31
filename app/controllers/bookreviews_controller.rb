class BookreviewsController < ApplicationController
    before_action :select_book, only: [:show, :edit, :update, :destroy]
    # ログインしていない場合はログインページへ飛ばす
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :search_book, only: [:index, :search]
    
    def index
        @bookreviews = Bookreview.all.order(created_at: :desc).page(params[:page]).per(10)
    end    

    def search
      @results = @p.result
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

    def show
    end
  
    def edit
      return redirect_to root_path if current_user.id != @bookreview.user.id
    end
  
    def update
      @bookreview.update(book_params) if current_user.id == @bookreview.user.id
      return redirect_to bookreview_path if @bookreview.valid?
      render 'edit'
    end
  
    def destroy
      @bookreview.destroy if current_user.id == @bookreview.user.id
      redirect_to root_path
    end
  

    private

    def book_params
      params.require(:bookreview).permit(
        :image,
        :title,
        :author,
        :text,
        :genre_id,
      ).merge(user_id: current_user.id)
    end
  
    def select_book
      @bookreview = Bookreview.find(params[:id])
    end

    # ransackの検索機能
    def search_book
      @p = Bookreview.ransack(params[:q])  # 検索オブジェクトを生成
    end
end
