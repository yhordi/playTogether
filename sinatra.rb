require 'sinatra'
require 'HTTParty'



get '/' do
  redirect 'index.html'
end

get '/HTTParty' do
  @party = HTTParty.get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=E6B0ADB9B2C8C41CC3A0D86C3F235406&steamids=76561197985852059")
  p @party
  # redirect '/'
  string = "{}"
end