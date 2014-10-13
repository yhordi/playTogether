require 'sinatra'
require 'httparty'
require 'dotenv'
Dotenv.load(File.expand_path("../.env",  __FILE__))
require "omniauth/strategies/steam"


get '/' do
  redirect 'index.html'
end

get '/HTTParty' do
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['SECRET_KEY']}&steamids=76561197985852059")
  @party.to_json

post "/auth/steam/callback" do
  content_type "text/plain"
  request.env["omniauth.auth"].info.to_hash.inspect
end

end