class ThemesController < ApplicationController
	def index
		@themes = Theme.all.order("created_at DESC")
	end
	def new
		@theme = Theme.new
	end
	def create
		@theme = Theme.new(theme_params)
		if @theme.save
			redirect_to root_path
		else 
			render 'new'
		end
	end

	private

		def theme_params
			params.require(:theme).permit(:name, :image_name)
		end
end
