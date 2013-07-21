require 'sinatra'

get "/home" do
  halt erb(:single_page)
end

get "/livevideo" do
  halt erb(:two_page)
end
