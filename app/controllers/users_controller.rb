class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:home,:home2]
	def home
	end

	def home2
	end

	def index
		@user = current_user
		@users=User.all
		@book = Book.new
	end

	def show
		@users=User.all
		@user =User.find(params[:id])
		@book_new =Book.new
		@books =@user.books
		@book = Book.new
	end

	def edit
		@user=User.find(params[:id])
		# 下のパラムズで整理したものを受け取る
		# 個人のデータが必要
	  redirect_to user_path(current_user) unless current_user.id == @user.id
	end

	def update
		    user =User.find(params[:id])
	     if user.update(user_params)
	        redirect_to user_path(user.id)
	        flash[:alert] = "You have updated user successfully."
	    else
	    	@user=user
	    	render "edit"
	    end
    end

    def follower_users
    	@users=User.find(params[:id]).follower_user
    end

    def follow_users
    	@users=User.find(params[:id]).following_user
    end
	private
	def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)
	end
end

# show等viewページにつながりるところは⇨@
# 内部操作のみになる場合は⇨@が必要ない
	# params.require(:user).permit(:name, :introduction, :profile_image)これ書くことで受け取るuserの:name,
	 # :introduction, :profile_imageのみ通す
