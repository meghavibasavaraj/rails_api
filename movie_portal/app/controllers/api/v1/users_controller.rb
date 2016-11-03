class Api::V1::UsersController< ApplicationController
	def create
		@user=User.new(user_params)
		if @user.save
			render json: {message:'success',data:@user,status_code:201}
		else
			render json: {message:'failure',data:@user.errors,status_code:422}
		end
	end

	def index
		@user=User.all
		render json: {message:'success',data:@user,status_code:201}
	end

	def show
		@user=User.find_by_name(params[:name])
		render json: {message:'success',data:@user,status_code:201}
	end

	def update
		@user=User.find_by_id(params[:id])
		if @user.update_attributes(user_params)
		render json: {message:'success',data: @user,status_code:201}
	else
		render json: {message:'failure',data:@movie.errors,status_code:422}
	end
	end

	def destroy
		@user=User.find_by_id(params[:id])
		@user.destroy
		render json: {message:'success',data: @user,status_code:201}
	end

	private
	def user_params
		params.require(:user).permit(:name,:age,:role,:gender)
	end
end