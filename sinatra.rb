require 'sinatra'
require 'httparty'
require 'dotenv'
Dotenv.load(File.expand_path("../.env",  __FILE__))

get '/' do
  redirect 'index.html'
end

post '/user/Url' do
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?key=#{ENV['SECRET_KEY']}&vanityurl=#{params[:Url]}")
  @party.to_json
end

post '/user/Id' do
  p params[:Id]
  # [:response]
  # [:steamid]
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['SECRET_KEY']}&steamids=#{params[:Id]}")
  @party.to_json
end

