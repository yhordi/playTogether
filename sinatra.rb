require 'sinatra'
require 'httparty'
require 'dotenv'
Dotenv.load(File.expand_path("../.env",  __FILE__))
# require "omniauth/strategies/steam"


get '/' do
  redirect 'index.html'
end

get '/HTTParty' do
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?key=#{ENV['SECRET_KEY']}&vanityurl=yhordi")
  @party.to_json

end

# @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['SECRET_KEY']}&steamids=yhordi")