require 'net/http'


class RoutesController < ApplicationController
  
  def index
    oauth_response = self.fetch_auth_code
    
    # get bearer token and athlete id:
    bearer_token = oauth_response['access_token']
    athlete_id = oauth_response['athlete']['id']

    # puts bearer_token, athlete_id
    routes = fetch_routes(bearer_token, athlete_id)
    # puts routes
  end

  def fetch_auth_code
    @code = params[:code]
    @scope = params[:scope]

    uri = URI('https://www.strava.com/oauth/token?client_id=78463&client_secret=8ce354c25761f81702a3e3ef1efcf2ed40e6ce3d&code=' + @code + '&grant_type=authorization_code')
    puts uri
    
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = Net::HTTP::Post.new(uri)
        http.request(request)
    end
    puts response
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
        response = JSON.parse(response.body)
        puts response
    else
        response
    end

    return response
  end

  def fetch_routes(bearer_token, athlete_id)
    puts "Fetching athlete routes..."

    uri = URI('https://www.strava.com/athletes/' + athlete_id.to_s + '/routes')
    puts uri

    headers = {
      'Authorization'=>'Bearer ' + bearer_token
    }
    puts headers

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = Net::HTTP::Post.new(uri, headers)
        http.request(request)
    end
    puts response

    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
        response = JSON.parse(response.body)
        puts response
    else
        response
    end
  end

end
