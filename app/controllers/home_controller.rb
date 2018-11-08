class HomeController < ApplicationController
	def index
		@cryptos = StartScrap.new.perform
		if params['cryptos']
			@crypto = @cryptos[params['cryptos']]
		end
	end
end
