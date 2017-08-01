class HomeController < ApplicationController

	def index
  	@magazines = Magazine.all
	end
end
