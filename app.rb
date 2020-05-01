require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do 
      erb :'/pirates/new'
    end

    get '/new' do
      erb :'/pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(name: params[:pirate][:name], height: params[:pirate][:height], weight: params[:pirate][:weight])

      params[:pirate][:ships].each do |ship_info|
        Ship.new(ship_info)
      end

      @ship = Ship.all
      erb :'pirates/show'
    end

  end
end
