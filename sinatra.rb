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
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['SECRET_KEY']}&steamids=#{params[:Id][:response][:steamid]}")
  @party.to_json
end

post '/friends' do
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['SECRET_KEY']}&steamid=#{params[:Id]}&relationship=friend")
  @party.to_json
end

