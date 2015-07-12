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

end