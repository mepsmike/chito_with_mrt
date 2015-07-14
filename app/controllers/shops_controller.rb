class ShopsController < ApplicationController

	def index

		if params[:r_type]

			@r_type = params[:r_type]
			@station = Mrt.find(params[:mrt][:mrt_id])
			
			

			params = { category_filter: @r_type, sort:"1"}
			coordinates = {latitude: @station.latitude, longitude: @station.longitude}
			@shops = Yelp.client.search_by_coordinates(coordinates, params) 
		
		
		else
			params = {  }

			coordinates = {latitude: 25.030009, longitude: 121.472389}

			@shops = Yelp.client.search_by_coordinates(coordinates, params) 
		end

	end



end
