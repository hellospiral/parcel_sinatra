require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcel')
require('pry')
require('launchy')

get('/') do
  erb(:form)
end

get('/cost') do
  @height = params['height']
  @length = params['length']
  @width = params['width']
  @weight = params['weight']
  @distance = params['distance']

  new_parcel = Parcel.new(@height, @length, @width, @weight)
  @cost = new_parcel.cost_to_ship(@distance)
  erb(:cost)
end
