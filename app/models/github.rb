class Github

  Octokit.auto_paginate = true
  attr_accessor :user_code, :token

  def initialize env = nil, token = nil
    @env = env
    @token = token
  end

  def user_info username = nil
    api_response = api.user(username)
    return {
      github_id: api_response["id"],
      username: api_response["login"].downcase,
      image_url: api_response["avatar_url"],
      name: api_response["name"],
      email: api_response["email"]
    }
  rescue Octokit::NotFound
    return {}
  end

  def api
    if @token
      return Octokit::Client.new(access_token: @token)
    else
      return Octokit::Client.new(client_id: @env["gh_client_id"], client_secret: @env["gh_client_secret"])
    end
  end

  def oauth_link
    params = {
      client_id: @env["gh_client_id"],
      redirect_uri: @env["gh_redirect_url"]
    }
    return "https://github.com/login/oauth/authorize?#{params.to_query}"
  end

  def get_access_token user_code
    @token = HTTParty.post(
      "https://github.com/login/oauth/access_token",
      {
        body: {
          client_id: @env["gh_client_id"],
          client_secret: @env["gh_client_secret"],
          code: user_code
        }
      }
    ).split("&")[0].split("=")[1]
    return @token
  end

end
