class PromotersController < ApplicationController

	def index
		@promoters = Promoter.all 
	end
end
