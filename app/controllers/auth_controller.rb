class AuthController < ApplicationController
  def index
    redirect_to('http://www.strava.com/oauth/authorize?client_id=78463&response_type=code&redirect_uri=http://127.0.0.1:3000/routes&approval_prompt=force&scope=read', allow_other_host: true)
  end
end
