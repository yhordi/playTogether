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
  p params
  # http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=E6B0ADB9B2C8C41CC3A0D86C3F235406&steamid=76561197985852059&relationship=friend
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['SECRET_KEY']}&steamid=#{params[:Id]}&relationship=friend")
  @party.to_json
end

