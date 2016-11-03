class Api::V1::MoviesController< ApplicationController
	def create
		@movie=Movie.new(movie_params)
		if @movie.save
			render json: {message:'success',data:@movie,status_code:201}
		else
			render json: {message:'failure',data:@movie.errors,status_code:422}
		end
	end

	def index
		@movie=Movie.all
		render json: {message:'success',data:@movie,status_code:201}
	end

	def show
		@movie=Movie.find_by_title(params[:title])
		render json: {message:'success',data:@movie,status_code:201}
	end

	def update
		@movie=Movie.find_by_id(params[:id])
		if @movie.update_attributes(movie_params)
		render json: {message:'success',data: @movie,status_code:201}
	else
		render json: {message:'failure',data:@movie.errors,status_code:422}
	end
	end

	def destroy
		@movie=Movie.find_by_id(params[:id])
		@movie.destroy
		render json: {message:'success',data: @movie,status_code:201}
	end

	private
	def movie_params
		params.require(:movie).permit(:title,:year,:rating,:language)
	end
end