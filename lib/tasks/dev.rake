namespace :dev do
	
	task :get_mrt => :environment do

	   conn = Faraday.new(:url => 'https://raw.githubusercontent.com' )
        res = conn.get '/evenchange4/mrt_opendata/master/mrt.json'
        data = JSON.parse( res.body )
    

        data.each do |u|
            mrt = Mrt.create!( :name => u["name"], :address => u["address"],:longitude => u["longitude"],:latitude => u["latitude"] )
            puts "Create MRT"
        end
	end

    task :get_mrt_station => :environment do

        conn = Faraday.new(:url => 'https://raw.githubusercontent.com' )
        res = conn.get '/repeat/taipei-metro-stations/master/taipei.json'
        data = JSON.parse( res.body )
    

        #data["features"].each_with_index do |u, index|
        data["features"].each do |u|
            #mrt.new
            #mrt.uid = u['properties']['編號']
            #mrt.kk = u['properties']['編號']

            #mrt.save
            #puts "creating..."
            #puts "#{index} #{u['properties']['編號']}"
        #end
        #byebug

         mrt = MrtStation.create!( :name => u["properties"]["站名"], :address => u["properties"]["地址"],:line=> u["properties"]["地址"],:latitude => u["properties"]["緯度"],:longitude => u["properties"]["經度"] )
         puts "Create Mrt_station"
         end
    end

    task :get_yelp => :environment do

       params = {  }

        coordinates = {latitude: 25.030009, longitude: 121.472389}

        @shops = Yelp.client.search_by_coordinates(coordinates, params)  
        
        byebug
    end

end