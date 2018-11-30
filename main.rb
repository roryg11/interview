require 'sinatra/base'
Dir['./lib/*.rb'].each { |f| require f }

class Main < Sinatra::Base
  get '/' do
    @addresses = [];
    @lat_long_list = [
      [61.582195, -149.443512],
      [44.775211, -68.774184],
      [25.891297, -97.393349],
      [45.787839, -108.502110],
      [35.109937, -89.959983],
    ]


    @lat_long_list.each do |tup|
      address = Address.new;
      address.lat = tup[0]
      address.lng = tup[1]
      address.full_address = address.reverse_geocoded_by(address.lat, address.lng).first.address
      @addresses.push(address)
    end

    erb :index #, locals: { addresses: addresses }
  end
end
