class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @account = current_user
    @like_reviews = @account.likes.map { |like| like.bookreview }
  end
end
