class FavoritesController < ApplicationController
	before_action :set_book
	def create
    	@favorite = current_user.favorites.new(book_id: @book.id)
    	@favorite.save
	end

	def destroy
	     @favorite = current_user.favorites.find_by(book_id: @book.id)
	     @favorite.destroy
	end
	private
	def set_book
	    @book = Book.find(params[:book_id])
	end
end







# class LikesController < ApplicationController
#   before_action :set_dream

#   def create
#     @like = Like.create(user_id: current_user.id, dream_id: @dream.id)
#   end

#   end

#   private
#   def set_dream
#     @dream = Dream.find(params[:dream_id])
#   end
# end
# コントローラ
# favoritesコントローラを追加@
# createアクションを追加@
# 用途：いいねを作成する
# destroyアクションを追加@
# 用途：いいねを削除する
# いいねを作成, いいねを削除した後は、行う前にいた画面に遷移すること