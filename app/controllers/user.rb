# new user form
get '/users/new' do

  erb :'users/new'
end

# create new user
post '/users' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect "/users/#{@user[:id]}"
  else
    status 400
    erb :'users/new'
  end
end

#list all users (for dev)
get '/users' do
  @users = User.all
  erb :'users/all'
end

#users profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/index'
end

get '/users/:id/spots' do
  @user = User.find(params[:id])
  @spots = Spot.all
  return @spots.to_json
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  if current_user
    erb :"users/edit"
  else
    status 404
    "PAGE NOT FOUND"
  end
end

put '/edit' do
  current_user.username = params[:username]
  current_user.email = params[:email]
  current_user.password = params[:password]
  current_user.save
  redirect "/users/#{current_user.id}"
end

delete '/users/:id' do

end

post '/location' do
  gmaps_api_response = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{params['lat']},#{params['lng']}&location_type=ROOFTOP&result_type=street_address&key=AIzaSyCDQi0iLI3S9Xbo_J79-orJbKjo9uN_gvw"
  location = HTTParty.get(gmaps_api_response)
  thing = location['results'][0]
  thing['formatted_address'].to_json
end

post '/submit_parking_spot' do
  binding.pry
  open_spot = Spot.create!(
    longitude: params["lng"],
    latitude: params["lat"]
    )
  binding.pry
end

