require 'utils/auth.ru'


get '/api/v1/covid/breach' do
  user = UserLockdown.find()
  UserRepresenter.for_collection.prepare(user).to_json
end

post '/api/v1/covid/breach' do
  user_id = get_userid(headers)
  breach = params[:breach]
  distance = params[:distance]
 
  if user_id.nil? or user_id.empty?
    halt 400, {:message=>"user_id field cannot be empty"}.to_json
  end


  UserLockdown.create!(
    user_id:  user_id, 
    breach:  breach,
    distance:  distance
  )
end




