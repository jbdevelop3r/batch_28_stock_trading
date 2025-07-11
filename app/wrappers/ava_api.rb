require 'uri'
require 'net/http'

class AvaApi
  def self.fetch_records(symbol)
    url = URI("https://alpha-vantage.p.rapidapi.com/query?datatype=json&output_size=compact&interval=5min&function=TIME_SERIES_INTRADAY&symbol=#{symbol}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = "91b14244camsh1783fa012f5731cp10dde2jsn9ee8a32de7fa"
    request["x-rapidapi-host"] = "alpha-vantage.p.rapidapi.com"

    response = http.request(request)
    JSON.parse(response.body)
  end
end