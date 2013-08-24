require './dvc-sinatra'

get "/" do
  halt erb(:index)
end

get "/company/:symbol" do
	@name = Company.where(name:"name").first
	@symbol = Company.where(symbol:params["symbol"]).first
	@price 	= MarketBeat.last_trade_real_time params["symbol"]
	@change = MarketBeat.change_and_percent_change params["symbol"]
	@volume = MarketBeat.volume params["symbol"]
	@days_range = MarketBeat.days_range params["symbol"]
	@eps = MarketBeat.earnings_to_share params["symbol"]
	@pe = MarketBeat.pe_ratio params["symbol"]
	@stock_exchange = MarketBeat.stock_exchange params["symbol"]


	market_cap = MarketBeat.market_capitalization params["symbol"]
	# @market_cap is rounded to billions
	@market_cap = market_cap.to_i / 1000
  halt erb(:company)
end

post "/company/:symbol" do
	@name = Company.where(name:"name").first
	@symbol = Company.where(symbol:params["symbol"]).first
	@price 	= MarketBeat.last_trade_real_time params["symbol"]
	@change = MarketBeat.change_and_percent_change params["symbol"]
	@days_range = MarketBeat.days_range params["symbol"]
  halt erb(:company)
end

get "/profile" do
  @profile = Profile.first
  halt erb(:profile)
end



