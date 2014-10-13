require 'sinatra'
require 'httparty'
require 'dotenv'
Dotenv.load(File.expand_path("../.env",  __FILE__))

get '/' do
  redirect 'index.html'
end
get '/HTTParty' do

  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['SECRET_KEY']}&steamids=76561197985852059")
  p @party
  @party.to_json
end