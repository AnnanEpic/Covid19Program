require 'httparty'



def get_userid(headers)
    response = HTTParty.get('http://localhost:8008/api/v1/auth/me', :headers => headers)
    response
end


def earn_point(auth_type,auth_value,user_id)
    query = { 
        "auth_type"     => auth_type,
        "auth_value"      => auth_value,
        "user_id" => user_id,
      }
    response  = HTTParty.post('http://localhost:8080/api/v1/evaluate/earn',:query => query)
    
